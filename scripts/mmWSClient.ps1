<#
.SYNOPSIS
    Creates a scripting client to the Micetro API interface.
    Version: 11.1
    Updated: 06/14/2024
    Copyright (c) 2024 BlueCat Networks

.DESCRIPTION
    Instantiates a Micetro JSON-RPC Client, and makes all API Methods available
    as mm<MethodName>. Parameters are specified for each function.
    All functions are stored after the first execution in the file(s) mmMethods.psm1,
    to speed up client generation

    mmWSClient supports Single Sign On via the signleSignOn parameter
	and supports both https (SSL) and http

    The parameters that were used for mmWSClient.ps1 are stored in _mm.defaults.xml, and
    passwords are stored encrypted, only reversible by the user logged in.

.EXAMPLE
    For examples please check out:
    https://docs.menandmice.com/en/latest/guides/user-manual/json_rpc/#mmwsclient

.LINK
    For further info and examples:
    https://docs.menandmice.com/en/latest/guides/user-manual/json_rpc/#mmwsclient

    The API documentation is included in Micetro Central and you can retrieve it through the following URL:
    http[s]://<IP or name of the server running the Micetro web app>/mmws/wsdldoc
#>

[CmdLetBinding()]
param (
	[String] $mmWSUri,
    [String] $username,
    [String] $password, # this is cleartext. Please only use for scripts. For interactive use, will prompt for password in a secure way
	[Switch] $SSO,
	[String] $centralServer, # not usually necessary, uses the default Central server specified for mmWS by default
    [Object] $namespaces=$null, # use mm to get additional -unofficial- API commands
    [String] $addressSpace = $null, # forces connecting to this address space, if configuured
	[Int]    $timeoutSeconds = 100,
    [Switch] $quiet, # for use in scripting that are sensitive to std output
    [String] $defaultsFile = '_mm.defaults.xml' #set to $null to ignore any defaults and not save defaults. Or a custom file name
)


$loginScript = {
	if ($this.SSO){
		$params = @{
			server = $this.centralServer
			singleSignOn = $true
		}
	} else {
		try {
			$maskedPwd = ConvertTo-SecureString $this.mmPassword
			$basicStr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($maskedPwd)
			$password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($basicStr)
			[System.Runtime.InteropServices.Marshal]::FreeBSTR($basicStr)
		} catch {
			#should never happen since we've already successfully decrypted the password earlier
			throw ('Could not decrypt stored password')
			exit 5
		}

		$params = @{
			"server"    = $this.centralServer
			"loginName" = $this.mmUser.toString()
			"password"  = $password
            "unauthorizedAsForbidden"  = $true
		}
	}

	$result = $this.invokeJSONCommand('Login',$params)
	$this.mmSession = $result.session
	return $result.session
}

$sendRequest = {
	param ($requestData, $isSSOLogin)

	$requestString = $this.toJSON([hashtable]$requestData)
	$req = [System.Net.HttpWebRequest]::CreateHttp($this.Url)
	$req.Timeout 	= $this.Timeout
	$req.ContentType=  "application/json;charset=`"UTF-8`""
	$req.Accept		= "application/json"
	$req.Method		= "POST"
	$req.Proxy		= $null
	$req.UseDefaultCredentials = $true
	$req.PreAuthenticate = $isSSOLogin

	if (-not $isSSOLogin -and $requestData.method -ne 'Login' -and -not [String]::IsNullOrWhiteSpace($this.mmSession)) {
		$req.Headers.Set('Authorization', ('Bearer {0}' -f $this.mmSession))
	}

	$buffer = [Text.Encoding]::GetEncoding('UTF-8').GetBytes($requestString)
	$reqStream = $req.GetRequestStream()
	$reqStream.Write($buffer,0,$buffer.length)
	$reqStream.Flush()
	$reqStream.Close()

	try {
		$resp = $req.GetResponse()
	} catch [System.Net.WebException]{
		#because mmws returns a HTTP error on errors, but still includes the error details in the body, we need to fetch the error from the error variable
		$resp = $_.Exception.GetBaseException().Response
		if (!$resp){
			# throw if there's no Response for some reason, so we don't mask the real exception that's causing it
			throw
		}
	}

	$respStream = $resp.GetResponseStream()
	$respReader = [System.IO.StreamReader]$respStream
	$respString = [String]($respReader.ReadToEnd())
	$respStream.Close()
	return $respString
}

$logDebug = {
	param([String]$msg)
	if ($this.logRequests -or $this.wantsVerbose){
		write-host -ForegroundColor Yellow $msg
	}
}

$invokeJSONCommand = {
    param([String]$Command,[Hashtable]$Parameters)

    $msgID = (Get-Random -minimum 1 -maximum 9999)
    $data = @{
        'jsonrpc'= '2.0';
        'method' = $Command.toString();
        'params' = [hashtable]$Parameters;
        'id'     = $msgID.toString()
	}

	$isSSOLogin = $Command -eq 'Login' -and $this.SSO

	if ($this.logRequests){
		# don't convert params to json unless we need to
		$this.logDebug(('Invoking API call {0} with {1}' -f $data.method,$this.toJSON($data.params)))
	}

	$t0 = Get-Date
	$retStr = $this.sendRequest($data)
	$this.logDebug(('{0} executed in {1} msec.' -f $data.method,[int]((Get-Date)-$t0).TotalMilliseconds))
	#$this.logDebug($retStr)

	try {
		$t0 = Get-Date
		$retObj = $this.jsonToHashtable($retStr, $isSSOLogin)
		$this.logDebug(("Parsing JSON took {0} msec" -f [int]((Get-Date)-$t0).TotalMilliseconds))
	} catch {
		#Central is not returning an error json obj. Let's assume $retStr is an error message
		$retObj = @{
			error = @{
				code = "109"
				message = $retStr
			}
		}
	}


	if ($retObj.error){

        if (@(5003,773) -contains [int]::Parse($retObj.error.code)){
            throw 'mmErr_relogin'
        } elseif ([int]::Parse($retObj.error.code) -eq 515){
            throw 'mmErr_noConnect'
        } else {
			$msg = '{0}: {1}' -f $Command, $retObj.error.message
			$ex = New-Object -TypeName System.Exception -ArgumentList $msg
			$ex.Data.Add('message', $retObj.error.message)
			$ex.Data.Add('code', $retObj.error.code)
			$ex.Data.Add('method', $data.method)
			$ex.Data.Add('params', $data.params)
            throw $ex
        }
    } elseif (-not $retObj.id){
        throw ("Missing Message ID")
    } elseif ($retObj.id -ne $msgID){
        throw ("Incorrect Message ID: {0}" -f $retObj.id)
    } elseif ($retObj.Keys -notcontains 'result') {
        throw "Missing result"
    } else {
        return $retObj.result
    }
}


$invokeAPICommand = {
    param($Command,[string[]]$CommandParamNames,$BoundParams)

    function doInvoke () {
        # add the session as the first parameter for all but the login command (which should not be here anyway)
		# Massage the input to a proper format for invokeJSONCommand

		#make the params. $null values are assumed to be unspecified whereas values are nilled by using empty strings, i.e. ''
		$jsonParams = @{}
		foreach ($paramKey in $BoundParams.Keys){
			if ($paramKey -in $CommandParamNames){
				# to exclude the Generic parameters, such as Verbose, Debug, etc
				$jsonParams[$paramKey]=$BoundParams[$paramKey]
			}
		}

		$result = $this.invokeJSONCommand($Command,$jsonParams)

        return $result
    }

    $global:mmLastCommand = $Command
    $this.wantsVerbose = $BoundParams['Verbose']
	$t0 = Get-Date

	try {
		$res = doInvoke
	} catch {
		$e = $_.Exception.GetBaseException().Message
		$global:mmLastError = $e
		if ($e -eq 'mmErr_relogin'){
			#re-login in case that's what's needed, except if using auth headers, where this should be automatic
			$this.mmLogin()
			$res = doInvoke
		} elseif ($e -eq 'mmErr_noConnect'){
			throw 'Unable to connect to Micetro Central. Network connection could not be established. Please try again later.'
		} else {
			throw
		}
	}

    $this.logDebug(("Invoking {0} took {1} msec in total" -f $Command,[int]((Get-Date)-$t0).TotalMilliseconds))
	$this.displayOutput($res)

    $global:mmLastResult = $res
    return $res
}

$jsonToHashtable = {
    param ([String] $inputString)

    $ser = New-Object System.Web.Script.Serialization.JavaScriptSerializer
    $ser.MaxJsonLength = [System.Int32]::MaxValue
    return [Hashtable]($ser.DeserializeObject($inputString))
}

$toJSON = {
    param ($inputData)

    if ($inputData -is [String]){
        #assume it is already json
        return $inputData
    } else {
       try {
            return ConvertTo-Json $inputData -Depth 100 -Compress
       } catch {
			$ser = New-Object System.Web.Script.Serialization.JavaScriptSerializer
			$ser.MaxJsonLength = [System.Int32]::MaxValue
			try {
				return $ser.Serialize(([hashtable]$inputData))
			} catch {
				throw ("Could not convert to JSON: {0}" -f $_.Exception.Message)
			}
		}
	}
}

$displayOutput = {
    param($result=$global:mmLastResult)

    if (($this.wantsVerbose -or $this.logRequests) -and !$this.quiet) {
        foreach ($item in $result.Keys) {
            Write-Host -NoNewline -ForegroundColor Red ($item + ":")
            $result.Item($item) | out-host
        }
    }
}

$makeObject = {
    param ($typeName,$BoundParams)
    return [Hashtable]$BoundParams
}

function publishMMMethods ($theClient, $wsdlURL, $version){
    ## publish the Micetro methods to the current global space
	# Some unique strings used as placeholders in the script generation. They must match the corresponding
	# instances in the template strings.

    function getReturnParameter ($Method,$WSDL){
        $ReturnParameterName = ''
        foreach ($el in $WSDL.definitions.types.schema.element) {
            if ($el.name -eq ($Method+"Response")){
                $ReturnEl = $el.complexType.sequence.element
                if ($ReturnEl -ne $null) {
                    if ($ReturnEl.GetType().BaseType.Name -eq 'Array') {
                        $ReturnParameterName = $ReturnEl[0].name
                    } else {
                        $ReturnParameterName = $ReturnEl.name
                    }
                }
                return $ReturnParameterName
                break
            }
        }
    }

    function getParamInfo (){
        param($method)

        # Get the parameter info on the real method.
        $methodInfo = if ($method -is "String") {$theClient.GetType().GetMethods() | Where { $_.Name -eq $method }} else {$method}
        if ($methodInfo)
        {
            if ($methodInfo.GetParameters().Count -le 1){
                return [System.Reflection.ParameterInfo[]]($methodInfo.GetParameters())
            } else{
                return [System.Reflection.ParameterInfo[]]@($methodInfo.GetParameters())
            }
        }
        return @()
    }


    function getParamTypePrefix ($paramType) {

        $pName = $paramType.Name.replace('&','')

        if ($pName.StartsWith('Nullable')){
            return ''
        } elseif ($paramType.Namespace -eq 'mm'){
            if ($paramType.isEnum) {
				$pName = if ($paramType.isArray) {'[String[]]'} else {'[String]'}
				return $pName
			} elseif ($paramType.isArray){
				return '[Hashtable[]]'
			} else {
				return '[Hashtable]'
			}
        } else {
            return ('[{0}]' -f $pName)
        }
    }


    $ParametersPlaceholder      = '#paramParametersPlaceholder#'
    $paramKeysPlaceholder       = '#paramKeys#'
    $returnParamsPlaceholder    = '#returnParams#'
    $CommandPlaceholder         = '#command#'

	$mmTemplateScript = @'
function mm#command# {
    [CmdLetBinding()]
    param(#paramParametersPlaceholder#)
    try {return $global:cli.invokeAPICommand("#command#",@(#paramKeys#),$PSBoundParameters)} catch {throw $_.Exception.GetBaseException()}
}

'@


    Write-Verbose "Generating service scripts..."
    $mmMethods = $theClient.GetType().GetMethods() |
        where {
            $_.DeclaringType.Name -eq "Service" -and
            $_.Name -ne "Login" -and
            -not $_.Name.StartsWith('Begin') -and
            -not $_.Name.StartsWith('End') -and
            -not $_.Name.StartsWith('add_') -and
            -not $_.Name.StartsWith('remove_') -and
            -not $_.Name.EndsWith('Async')
        }

    $mmTypes = $theClient.GetType().Assembly.GetTypes() |
        where {
                $_.Name -ne 'mm' -and
                ($_.BaseType -eq [System.Object])
        }


    #fetch wsdl as xml to get access to the ReturnParameter name
    Write-Verbose "Downloading WSDL..."
	$wc = New-Object System.Net.WebClient
    $wc.UseDefaultCredentials = $true
	$WSDLxml = [xml]$wc.DownloadString($wsdlURL)

	$scriptCollection = ''
	foreach ($method in $mmMethods) {

        $methodName = $method.Name
		$mmScriptName = "mm" + $methodName
		Write-Verbose "Processing function $mmScriptName"

		#get the primary return parameter. Don't know how to determine this any differently right now - parsing the entire raw WSDL
		$ReturnParameterName = (getReturnParameter $methodName $WSDLxml)

		$returnParameters       = @(('"{0}"' -f $ReturnParameterName))
        $invokingParameterNames = @()
        $invokingParameters     = @()
        $functionParams         = @()


        $paramInfo = [System.Reflection.ParameterInfo[]]((getParamInfo $method))

		foreach ($param in $paramInfo) {

			if ($param.Name -ne "session") {
				# Store keys so we know which parameters can be provided
                $invokingParameterNames += ('"{0}"' -f $param.Name)

				# Special handling of the out parameters, - because [ref] cannot be used in Invoke
				if ($param.IsOut) {
					$invokingParameters += '$null'
					$returnParameters += ('"{0}"' -f $param.Name)
				} elseif ($param.Name.EndsWith('Specified')) {
                    $refParam = $param.Name -replace 'Specified$',''
                    # "Specified params only used in invoke"
                    $invokingParameters += ('($PSBoundParameters.Keys -contains "{0}" )' -f $refParam)
                } else {
                    #type prefix, and default value
                    $paramPrefix = getParamTypePrefix $param.ParameterType
                    $paramPostfix = ''

                    $functionParams += ('{0}${1}{2}' -f $paramPrefix,$param.Name,$paramPostfix)
                    $invokingParameters += ('${0}' -f $param.Name)
				}
			}
		}

        $mmScriptString = $mmTemplateScript
        $mmScriptString = $mmScriptString.`
                            Replace($CommandPlaceholder,$methodName).`
                            Replace($ParametersPlaceholder,($functionParams -join ',')).`
                            Replace($paramKeysPlaceholder,($invokingParameterNames -join ',')).`
                            Replace($returnParamsPlaceholder,($returnParameters -join ','))


        try {
		    $mmExternalScriptBlock =[ScriptBlock]::Create($mmScriptString)

            #let's not add the function to the collection unless the above command succeeds
            $scriptCollection += $mmScriptString
        } catch {
            Write-Verbose "Generating a script for $methodName failed"
            Write-Verbose $mmScriptString
            #ugh! mm_AddAppliance and mm_ModifyDNSSecSigningKeyDescriptor!!
        }

	}


    $mmCreateObjString = @'
function New-mm#TypeName# {
    [CmdLetBinding()]
    param(#paramParametersPlaceholder#)
    return $global:cli.makeObject("#TypeName#",$PSBoundParameters)
}

'@

    foreach ($type in $mmTypes) {
        Write-Verbose ('Processing type {0}' -f $type.Name)
        if ($type -is [System.Object]){
            #only add the new-mmObj functions for object types, not arrays or enums
            $propParams = @()
            foreach ($prop in $type.GetProperties()){
                if (-not $prop.Name.EndsWith('Specified')){
                    $prefix = getParamTypePrefix $prop.propertyType
                    $propParams += ('{0}${1}' -f $prefix,$prop.Name)
                }
            }
            $scriptCollection += $mmCreateObjString.Replace('#TypeName#',$type.Name).Replace($ParametersPlaceholder,($propParams -join ','))
        }
	}

	$scriptCollection += ("`n`n" + '$mmMethodsWSDLInfo = @{version="#VERSION#";wsdlURL="#WSDLURL#"}'.Replace('#VERSION#',$version).Replace('#WSDLURL#',$wsdlURL))
	$scriptCollection += "`nExport-ModuleMember -Variable 'mmMethodsWSDLInfo' -Function * -CmdLet *"
    try {
        Set-Content -Force -Path $mmMethodsFilename -Value $scriptCollection
    } catch {
        Write-host -ForegroundColor 'Red' "Not able to save modules to $mmMethodsFilename. Try running Powershell as Administrator to regenerate the module"
    }

}

function getEncryptedPassword ($passwd){
    if ($passwd.GetType().Name -eq 'SecureString'){
        $maskedPwd = $passwd
    } else {
        $maskedPwd = ConvertTo-SecureString -AsPlainText $passwd -Force
	}
    return ConvertFrom-SecureString $maskedPwd
}

function isEmpty([string] $string)
{
    if ($string -ne $null) { $string = $string.Trim() }
    return [String]::IsNullOrEmpty($string)
}

#can be overridden, but in general stop
$ErrorActionPreference = 'Stop'
[void]([System.Reflection.Assembly]::LoadWithPartialName("System.Web.Extensions"))

$mmMethodsFilename = "./_mm.methods.psm1"
$currentUser = whoami
$defaultsFilePath = './' + $defaultsFile


if (!(isEmpty $defaultsFile) -and (Test-Path $defaultsFilePath)){
    try {
        $allDefaults = Import-Clixml $defaultsFilePath
    } catch {
        if (!$quiet){
            Write-Warning ("Defaults ignored. Could not read {0}. Is file corrupt?" -f $defaultsFile)
        }
        $allDefaults = @{$currentUser=@{}}
    }
} else {
    $allDefaults = @{$currentUser=@{}}
}

if (-not $allDefaults.ContainsKey($currentUser)){
    $allDefaults[$currentUser] = @{}
}

$defaults = $allDefaults[$currentUser]


if ($mmWSUri){
	$defaults.mmWSUri = $mmWSUri
} else {
	$defaults.mmWSUri = 'http://localhost/mmws'
}
if ($PSBoundParameters.Keys -contains 'centralServer'){
	$defaults.centralServer = $centralServer
}
if ($PSBoundParameters.Keys -contains 'namespaces') {
	$defaults.namespaces = if ($namespaces -is [array]) { $namespaces -join ','} else { $namespaces }
}
if ($username) { #no default value
	$defaults.username = $username
}
if ($password) { #no default value
	$defaults.passwordhash = getEncryptedPassword $password
}
if ($PSBoundParameters.Keys -contains 'addressSpace') {
	$defaults.addressSpace = $addressSpace
}

$https = $defaults.mmWSUri.StartsWith('https://')
$defaults.protocol = if ($https) {'https'} else {'http'}

if ($https) {
	# overloading the ServerCertificateValidationCallback seems to cause issues as it's global for the powershell session.
	# we implement the ICertificatePolicy instead.
    if (-not ([System.Management.Automation.PSTypeName]"TrustAllCertificatePolicy").Type) {
        add-type @"
            using System.Net;
            using System.Security.Cryptography.X509Certificates;
            public class TrustAllCertificatePolicy : ICertificatePolicy
            {
            public bool CheckValidationResult(
                ServicePoint srvPoint,
                X509Certificate certificate,
                WebRequest request,
                int certificateProblem)
                {
                    return true;
                }
            }
"@
    } # end if

    # and use it as CertificatePolicy
    [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertificatePolicy
}

if (!$SSO){

	#check here if the password that we need to decrypt, is decryptable, so we can ask the user for the password if it isn't
	if ($defaults.passwordhash){
		try {
			$maskedPwd = ConvertTo-SecureString $defaults.passwordhash
			$basicStr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($maskedPwd )
			$password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($basicStr)
			[System.Runtime.InteropServices.Marshal]::FreeBSTR($basicStr)
		} catch {
			write-warning 'Unable to decrypt stored password. Was defaults file copied from another server?'
			$defaults.passwordhash = $null
		}
	}

	if (!$defaults.username -or !$defaults.passwordhash){
		#we need to ask for creds, unless we're in quiet mode, in which case we just want to exit with a nice error code
		if ($quiet){
			Write-Output 'Missing username or password'
			exit 109
		} else {
			$creds = Get-Credential -Message 'Enter username and password to login to BlueCat Micetro' -UserName $defaults.username
            if (!$creds){
                exit 5
            }
			$username = $creds.UserName
			$password = $creds.GetNetworkCredential().password
			$defaults.passwordhash = getEncryptedPassword $password
			$defaults.username = $username
		}
	}
}

#ok we've collected things ... let's ping mmWS and see what it's running
$sessionURL = '{0}/api/command/web_getPreLoginInfo' -f $defaults.mmWSUri
try {
	$sessionResp = (ConvertFrom-Json (Invoke-WebRequest -UseBasicParsing -UseDefaultCredentials $sessionURL).Content).result
} catch {
	Write-Error ('Unable to connect to mmWS at {0}: {1}' -f $defaults.mmWSUri, $_.Exception.Message)
	exit 2
}

if ($SSO -and $sessionResp.ssoEnabled -eq 0){
	#SSO not configured on mmws preferences.cfg
	Write-Error ('Single Sign On has not been enabled on mmWS at {0}. Check preferences.cfg for mmWS' -f $defaults.mmWSUri)
	exit 3
}

if (isEmpty $defaults.centralServer){
	#if user didn't provide a central server, or cleared it, we use the default provided by mmWS
	$defaults.centralServer = $sessionResp.centralServer
} elseif ($sessionResp.centralServerFixed){
	if ($defaults.centralServer -ne $sessionResp.centralServer){
		Write-Warning "API is locked to Central server at $($sessionResp.centralServer) - centralServer parameter ($($defaults.centralServer)) is ignored."
	}
	$defaults.centralServer = $sessionResp.centralServer
}


if (!$quiet){
	Write-Output ('Connecting to mmWS at {0}' -f $defaults.mmWSUri)
	if ($defaults.centralServer){
		Write-Output ('Micetro Central Server: {0}, version {1}' -f $defaults.centralServer, $sessionResp.version)
	}
	if ('addressSpace' -in $defaults){
		Write-Output ('Address Space: "{0}"' -f $defaults.addressSpace)
	}
	if ($SSO){
		Write-Output ('Connecting as {0} using SSO' -f $currentUser)
	} else {
		Write-Output ('Connecting as {0}' -f $defaults.username)
	}
	if ($defaults.namespaces) {
		#show this if the namespaces are non-empty, or the user set it to empty via parameter
		Write-Output ('Namespaces: ' + $defaults.namespaces)
	}
}

#figure out what the full WSDL url should be
$queryParts = @()
if ($defaults.centralServer){
	$queryParts += ('server={0}' -f $defaults.centralServer)
}
if ($defaults.namespaces){
	$queryParts += ('ns={0}' -f $defaults.namespaces)
}
$wsdlQuery = if ($queryParts.Count -ne 0) {'?'+($queryParts -join '&')} else { '' }

$wsdlURL = '{0}/wsdl{1}' -f $defaults.mmWSUri,$wsdlQuery
Write-Verbose $wsdlURL


# if wsdlURL has changed from what is stored in mmMethodsWSDLInfo, (or Central is a newer version), or the methods file doesn't exist, we need to regenerate the _mm.methods.psm1
# we've stored the version and wsdlURL in the module file, so we import it and check what it was generated with
$needToRegenerateMethods = $false
if (Test-Path $mmMethodsFilename){
	#load it already, to check if we need to regenerate
	Import-Module $mmMethodsFilename -Force -Global -DisableNameChecking

	if ($Global:mmMethodsWSDLInfo.wsdlURL -ne $wsdlURL -or $Global:mmMethodsWSDLInfo.version -ne $sessionResp.version){
		$needToRegenerateMethods = $true
	}
} else {
	$needToRegenerateMethods = $true
}


if ($needToRegenerateMethods) {
	# create the client with the PS built-in cmdlet for Web services. We need to create it if we are to regenerate
	if (!$quiet){
		Write-Host "Regenerating methods from WSDL"
	} else {
		Write-verbose "Regenerating methods from WSDL"
	}
	Write-Verbose ("Generating client with New-WebServiceProxy via URL: {0}" -f $wsdlURL)

	$mmClient = New-WebServiceProxy -Uri $wsdlURL -Namespace 'mm' -Class 'mm' -UseDefaultCredential -ErrorAction Stop
	$mmClient.UseDefaultCredentials = $true
	$mmClient.RequestEncoding = [text.encoding]::GetEncoding('iso-8859-1')
	if ($https){
		$mmClient.Url = $mmClient.Url.replace('http:','https:') #because the WSDL is bugged in this respect
	}


	Write-Verbose "Generating all methods..."
	$mpub = measure-command {
		publishMMMethods $mmClient $wsdlURL $sessionResp.version
	}
	Write-Verbose ("Generating all methods took {0} msec" -f $mpub.TotalMilliseconds)

	#(re)import the newly (re)generated modules
	Write-Verbose "Importing modules"
	$mimport = measure-command {
		Import-Module $mmMethodsFilename -Force -Global -DisableNameChecking
	}
	Write-Verbose ("Importing module took {0} msec" -f $mimport.TotalMilliseconds)
}

$cliProps = @{
	Url = '{0}/json' -f $defaults.mmWSUri
	Timeout = $timeoutSeconds*1000
	mmUser = $defaults.username
	mmPassword = $defaults.passwordhash
	mmSession = ''
	centralServer = $defaults.centralServer
	SSO = $SSO
	quiet = $quiet
	logRequests = $false
	wantsVerbose = $PSBoundParameters['Verbosity']
}

$mmClient = new-object PSObject -Property $cliProps

$mmClient = $mmClient |
    Add-Member -MemberType ScriptMethod -Name mmLogin           -Value $loginScript                 -Force          -PassThru |
    Add-Member -MemberType ScriptMethod -Name sendRequest       -Value $sendRequest                 -Force          -PassThru |
    Add-Member -MemberType ScriptMethod -Name invokeAPICommand  -Value $invokeAPICommand          	-Force          -PassThru |
	Add-Member -MemberType ScriptMethod -Name invokeJSONCommand -Value $invokeJSONCommand           -Force          -PassThru |
	Add-Member -MemberType ScriptMethod -Name logDebug 			-Value $logDebug        		   	-Force          -PassThru |
    Add-Member -MemberType ScriptMethod -Name displayOutput     -Value $displayOutput               -Force          -PassThru |
    Add-Member -MemberType ScriptMethod -Name jsonToHashtable   -Value $jsonToHashtable             -Force          -PassThru |
    Add-Member -MemberType ScriptMethod -Name toJSON            -Value $toJSON                      -Force          -PassThru |
    Add-Member -MemberType ScriptMethod -Name makeObject        -Value $makeObject                  -Force          -PassThru

$global:cli = $mmClient


if ($SSO){
	Write-Verbose 'Logging in with Single Sign On negotiatation'
} else {
    Write-Verbose "Logging in..."
}
$session = $mmClient.mmLogin()

if ($session){

	# handle multiple address spaces, not assuming we are necessarily running a version that supports that
    # If Address Space is not explicitly set, will not spend time setting the address space
    # Customers with multiple address spaces must take into account to never explicitly set the address space
	if ($null -ne $defaults.addressSpace -and (Get-Command 'mmSetCurrentAddressSpace' -ErrorAction SilentlyContinue)){
		if ($defaults.addressSpace -eq "Default" -or $defaults.addressSpace -eq ''){
			mmSetCurrentAddressSpace -addressSpaceRef '{#25-#1}'
		} else {
			mmSetCurrentAddressSpace -addressSpaceRef $defaults.addressSpace
		}
	}

	if (!$quiet){
        $msg = "`r`nYou are now connected to the Micetro Web Services API!`r`n"
        Write-host $msg -ForegroundColor Green -BackgroundColor Black

        Write-Host "All available Micetro API Methods are now available as functions named mm<MethodName>" -ForegroundColor "Yellow"  -BackgroundColor Black
        Write-Host "    Example:>   mmGetDNSServers -sortBy name  " -ForegroundColor 'Cyan' -BackgroundColor Black
        Write-Host "All API Objects can be created with methods New-mm<ObjectName> " -ForegroundColor "Yellow"  -BackgroundColor Black
        Write-Host "    Example:>   New-mmProperty -name 'Title' -value 'My Title'" -ForegroundColor 'Cyan' -BackgroundColor Black
	}

    if (!(isEmpty $defaultsFile) ) {
        try {
            $j = Export-Clixml -InputObject $allDefaults -Path $defaultsFilePath -Force
        } catch {
            Write-Error "Not able to save to $defaultsFile. Try running Powershell as Administrator to save the configuration, or set the -defaultsFile parameter."
        }
    }
} else {
	write-warning "Could not login using provided username/password. Please try again."
}

