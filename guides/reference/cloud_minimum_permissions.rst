.. meta::
   :description: Minimum permissions for adding AWS and Azure accounts to Micetro
   :keywords: Micetro credentials, AWS management console, Micetro, Azure 

.. _cloud-minimum-permissions:

Integrating Cloud Services with Micetro: Permissions Guide for AWS
==================================================================
This page provides the minimum and recommended permissions necessary for successfully adding AWS services to Micetro. Whether you're dealing with DNS, IPAM, or cloud network management, ensuring the correct permissions is essential for a seamless integration experience.

Minimum Permissions for Adding AWS Account
-------------------------------------------
When adding an AWS account to Micetro, ensure the credentials used have the following permissions:

**Required permissions**:

* iam:GetUser
* iam:ListGroupsForUser
* sts:GetCallerIdentity

For Multi-account setups, add these additional permissions:

* iam:GetGroup
* iam:ListGroupPolicies
* iam:GetGroupPolicy

Restrict IAM permissions to the user associated with the credentials provided to Micetro.

If you want Micetro to be able to read the alias of your account to use as an account name then the following permission is also needed:

* iam:ListAccountAliases

DNS Management Permissions
^^^^^^^^^^^^^^^^^^^^^^^^^^
**Required permissions**:

* route53:ListHostedZones
* route53:GetHostedZoneCount
* route53:ListHealthChecks
* route53:ListHostedZonesByName

**Recommended permissions**:

To maximize the capabilities of Cloud network management in Micetro, it is highly recommended to grant the following permissions. It's important to note that you have the flexibility to omit certain permissions or restrict the resources they can access based on your preferences. However, be mindful that such limitations may impact Micetro's functionality. For instance, omitting the **ec2:DeleteVpc** permission will result in Micetro being unable to remove Virtual Private Clouds (VPCs).

* route53:GetHostedZone
* route53:CreateHostedZone
* route53:DeleteHostedZone
* route53:ListResourceRecordSets
* route53:ChangeResourceRecordSets

Cloud Network Management Permissions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
**Required permissions**:
  
* ec2:DescribeRegions
* ec2:DescribeSubnets
* ec2:DescribeVPCs
* ec2:DescribeInstances

**Recommended permissions**:

For optimal Cloud network management in Micetro, it is strongly recommended that you grant the following permissions. Keep in mind that you have the flexibility to omit certain permissions or restrict resource access according to your needs. However, be aware that such exclusions may result in limited functionality within Micetro. For instance, if you skip the **ec2:DeleteVpc** permission, Micetro won't be able to remove Virtual Private Clouds (VPCs).

* ec2:CreateVpc
* ec2:DeleteVpc
* ec2:CreateSubnet
* ec2:DeleteSubnet
* ec2:CreateTags
* ec2:DeleteTags

Permissions in a Multi-Account Setup
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
In an AWS multi-account setup, additional permissions are necessary. For more information about multi-account setup, see :ref:`aws-multi-account`.

* The user integrated into Micetro must possess inline group policies enabling the user to execute **sts:AssumeRole** on the designated accounts it needs to connect to.

* In the accounts where roles are assumed from the Micetro user, roles must already be configured, with the account containing the Micetro user designated as a trusted entity.

* Furthermore, the roles assumed in these accounts should be assigned the DNS and/or cloud network permissions outlined in the required/recommended permission list above.


