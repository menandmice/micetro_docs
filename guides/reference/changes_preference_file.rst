.. meta::
   :description: With version 11.2, the formatting of preferences.cfg files for all binaries changed to INI. When the version is upgraded, these files are automatically transformed.
   :keywords: preference, preference.cfg, Micetro

.. _change-preference-file:

Changes to preferences.cfg files in 11.2
---------------------------------------- 

With the release of Micetro 11.2, the formatting of the ``preferences.cfg`` files, for all binaries changed from XML to INI. These binaries include Central, the DNS agent, the DHCP agent, the update agent, and web services (mmWS). You can configure individual components in Micetro by editing the preference files.

.. note::
    The preference files are also referred to as the *configuration files*.

The default locations of the preference files are as follows:

.. csv-table::
  :header: "Windows", "Linux"
  :widths: 50, 50

  "C:\ProgramData\Men and Mice\Central\preferences.cfg", "/var/mmsuite/mmcentral/preferences.cfg"
  "C:\ProgramData\Men and Mice\DNS Server Controller\preferences.cfg", "/var/mmsuite/dns_server_controller/preferences.cfg"
  "C:\ProgramData\Men and Mice\DHCP Server Controller\preferences.cfg", /var/mmsuite/dhcp_server_controller/preferences.cfg"
  "C:\ProgramData\Men and Mice\Updater\preferences.cfg", "/var/mmsuite/updater/preferences.cfg"
  "C:\ProgramData\Men and Mice\Web Services\preferences.cfg", "/var/mmsuite/web_services/preferences.cfg"

File transformation
===================
When the binary is started after the upgrade, the files will be automatically transformed. A copy of the existing preference file is created with the name ``preferences.cfg.bak``. If the ``preferences.cfg`` file is not writable, the file will not be transformed, but will continue to work as before. However, the ``preferences.cfg`` file should be writable by the binary, as there are rare occasions when the binary itself needs to alter the preference file.

The name of one preference key is also automatically renamed as part of this change: 

``Database`` becomes ``DatabaseType``.

Examples
========
An example of a preference file for Central with the old XML format:

.. code-block::

    <Password value="dXi6n8JHFmbJOssIva3JhO316A5d68qk" />
    <GUID value="6ea66fa1-e507-a358-8bee-7f04eb6af614" />
    <Database value="mssql" />
    <DatabaseServer value="localhost@mydatabase;Encrypt=no" />
    <DatabaseUsername value="micetro_user" />
    <DatabasePassword value="$3$1$II+HwZRCvHV7UvZ+ZYN6W/UXaFtR1l3QdEXwvqNmL//vERjs3FPnDQ50" />
    <CrashDumpEnabled value="0" />
    <CrashDumpLevel value="3" />

After transformation, the preference file with the INI format looks like this:

.. code-block::

    Password = dXi6n8JHFmbJOssIva3JhO316A5d68qk
    GUID = 6ea66fa1-e507-a358-8bee-7f04eb6af614

    [Database]
    Type = mssql
    Server = "localhost@mydatabase;Encrypt=no"
    Username = micetro_user
    Password = $3$1$II+HwZRCvHV7UvZ+ZYN6W/UXaFtR1l3QdEXwvqNmL//vERjs3FPnDQ50

    [CrashDump]
    Enabled = false
    Level = 3

Sections
^^^^^^^^
The preference file format supports rudimentary sections. This means that preference keys sharing a prefix can be grouped together under a section with the prefix as its name. The names of everything following the section header are prefixed to the key value until the next section. Preferences not belonging to a section must be listed at the top of the file.

The INI example above demonstrates how sections can be used to group preference keys that share the same prefix. Using sections is optional and, if preferred, you can write the keys out fully as before, e.g., ``DatabaseServer`` is the equivalent of ``Server`` under a ``[Database]`` section.

When adding new lines to the preference file, make sure not to inadvertently place them in a section. For example, adding ``FooBar = true`` to the bottom of the file example above would actually add the preference ``CrashDumpFooBar`` to the file. If you are unsure, add new lines at the top of the file.

.. note::
    Preference keys are still case-insensitive, i.e., ``password``, ``Password``, and ``PASSWORD`` are all the same.

    If a preference key occurs two or more times in the file, only the final value is used.


Strings
^^^^^^^
Preference values that contain whitespaces, semicolons, or hash signs must be quoted. Other string values do not require quotation.

Quotation marks within quoted strings need to be escaped, e.g., ``lorem = "ipsum \ "dolor\" sit amet"``.

Booleans
^^^^^^^^
In the XML format, the values for Boolean preferences were either 0 or 1, e.g., ``<CrashDumpEnable value="1"/>``. When transformed to the INI format, the values will remain either 0 or 1, but the values ``true`` and ``false`` can now be used instead. 

.. note::
    It is recommended to use ``true`` and ``false`` moving forward to align with the INI format, e.g., ``CrashDumpEnable = true``.


Comments
^^^^^^^^
The INI format supports comments. You can use either `;` and `#` to comment on what is following in a line or a whole line, if the comment is placed at the start of the line.

Example:

.. code-block::

    Password = dXi6n8JHFmbJOssIva3JhO316A5d68qk
    GUID = 6ea66fa1-e507-a358-8bee-7f04eb6af614

    [Database]
    Type = mssql
    Server = "localhost@mydatabase;Encrypt=no" ; Need to be quoted because of ';'
    Username = test ; micetro_user 
    Password = $3$1$II+HwZRCvHV7UvZ+ZYN6W/UXaFtR1l3QdEXwvqNmL//vERjs3FPnDQ50

    #[CrashDump]
    #Enabled = true
    #Level = 3
 
.. warning::
    Comments are **not** maintained when the binary itself updates the preferences. For example, when Central replaces a ``plaintext:mypassword`` value with a hash for the ``DatabasePassword`` preference.
