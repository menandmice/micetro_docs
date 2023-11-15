.. meta::
   :description: A principle of least privilege approach to adding AWS accounts to Micetro
   :keywords: Micetro credentials, AWS management console, Micetro by Men&Mice, 

.. _aws-minimum-permissions:

Adding AWS Accounts to Micetro: A Guide to Minimum Permissions
===============================================================
This page outlines the minimum and recommended permissions required for adding AWS accounts to Micetro, as well as the corresponding minimum and recommended permissions for DNS/Cloud Network management.

Minimum Permissions for Adding AWS Account
-------------------------------------------
When adding an AWS account to Micetro, ensure the credentials used have the following permissions:

* iam:GetUser
* iam:ListGroupsForUser
* sts:GetCallerIdentity

For Multi-account setups, add these additional permissions:

* iam:GetGroup
* iam:ListGroupPolicies
* iam:GetGroupPolicy

Restrict IAM permissions to the user associated with the credentials provided to Micetro.

DNS Management Permissions
^^^^^^^^^^^^^^^^^^^^^^^^^^
Required permissions:
"""""""""""""""""""""
* route53:ListHostedZones
* route53:GetHostedZoneCount
* route53:ListHealthChecks

Recommended permissions:
""""""""""""""""""""""""
To maximize the capabilities of Cloud network management in Micetro, it is highly recommended to grant the following permissions. It's important to note that you have the flexibility to omit certain permissions or restrict the resources they can access based on your preferences. However, be mindful that such limitations may impact Micetro's functionality. For instance, omitting the **ec2:DeleteVpc** permission will result in Micetro being unable to remove Virtual Private Clouds (VPCs).

* route53:GetHostedZone
* route53:ListHostedZonesByName
* route53:CreateHostedZone
* route53:DeleteHostedZone
* route53:ListResourceRecordSets
* route53:ChangeResourceRecordSets

Cloud Network Management Permissions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Required Permissions:
"""""""""""""""""""""
  
* ec2:DescribeRegions
* ec2:DescribeSubnets
* ec2:DescribeVPCs

Recommended Permissions:
""""""""""""""""""""""""
For optimal Cloud network management within Micetro, it is strongly advised to grant the following permissions. Keep in mind that you have the flexibility to omit certain permissions or restrict resource access according to your needs. However, be aware that such exclusions may result in limited functionality within Micetro. As an illustration, if you skip the **ec2:DeleteVpc** permission, Micetro will be unable to remove Virtual Private Clouds (VPCs).

* ec2:CreateVpc
* ec2:DeleteVpc
* ec2:CreateSubnet
* ec2:DeleteSubnet
* ec2:DescribeInstances
* ec2:CreateTags
* ec2:DeleteTags

Permissions in a Multi-Account Setup
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
In an AWS multi-account setup, additional permissions are necessary. For more information about multi-account setup, see :ref:`aws-multi-account`.

* The user integrated into Micetro must possess inline group policies enabling the user to execute sts:AssumeRole on the designated accounts it needs to connect to.

* In the accounts where roles are assumed from the Micetro user, roles must already be configured, with the account containing the Micetro user designated as a trusted entity.

  * Furthermore, the roles assumed in these accounts should be assigned the DNS and/or cloud network permissions outlined in the required/recommended permission list above.
