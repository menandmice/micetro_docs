.. meta::
   :description: How to connect Micetro by Men&Mice to multiple AWS accounts using single credentials
   :keywords: Micetro credentials, AWS, Micetro by Men&Mice, 

.. _aws-multi-account:

Configuring AWS Multi-Account Setup
======================================
You can connect Micetro to multiple AWS accounts using a single set of credentials. This is achieved by configuring a cloud account to assume roles in other accounts. The credentials you add to Micetro when setting up multiple AWS cloud accounts should belong to a user who is a member of a group. This group needs to be configured to allow members to assume AWS roles on other accounts with access to cloud networks (via EC2) or DNS services (via Route53).

Set Up and Configuration
------------------------

I.  Creating a Group with User Access to Roles on Other Accounts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
You can either select an existing user or create a new one. This can be done through the AWS Management Console or by using the AWS CLI command ``[iam|create-user]``.

1. Open :guilabel:`IAM service` in the management console.

2. Select :guilabel:`Users` on the left-hand menu or under IAM resources.

3. Either select an existing user to use, or create a new user by clicking :guilabel:`Add user` and following the wizard's steps. 

   * If creating a new user, ensure you allow programmatic access to generate an access key ID and secret access key pair for adding the account to Micetro. 
   * Attach the *IAMReadOnlyAccess* policy to the user.
   * If you want to manage Route53 and VPCs on this account, also attach the *AmazonRoute53FullAccess* and *AmazonEC2FullAccess* policies.

4. Create a group. This can be done through the AWS Management Console or by using the AWS CLI command ``[iam|create-group]``.

   .. note::
     Make sure this is done under the account where the user is located.
   
   * Under :guilabel:`IAM service`, select :guilabel:`Groups`, then select :guilabel:`Create New Group`.

   * You'll be prompted to attach policies to the group - select :guilabel:`Next Step`.

   * Review the settings and select :guilabel:`Create Group` to finish.

5. Add the user to the group. This can be done through the AWS Management Console or by using the AWS CLI command ``[iam|add-user-to-group]``.

   * On the :guilabel:`Groups` menu, access the group you created in the previous step.

   * On the :guilabel:`Users` tab, select :guilabel:`Add Users to Group`.

   * Select user you want to add, then select :guilabel:`Add Users`.

II.  Creating and Configuring Roles for Each Account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Create a role:
   
   * Log in to the account that the user should have access to using the AWS Management Console.

   * Open the **IAM** service.

   * Select :guilabel:`Roles` on the left menu or under the IAM resource.

   * Select :guilabel:`Create role`.

2. Choose trusted entity:
   
   * Select :guilabel:`Another AWS account` as the trusted entity type. 

   * Enter the Account ID of the account containing the user who needs access. 

   * Select :guilabel:`Next: Permissions`.

3. Attach necessary policies:

   * Attach the necessary policies for Micetro by searching for them by name and selecting them.

      * *AmazonRoute53FullAccess* to manage hosted DNS zones.

      * *AmazonEC2FullAccess* to manage Cloud Networks and ranges.

      * *IAMReadOnlyAccess* so that Micetro can access the account alias. This does not need to be attached if you do not want AWS account aliases to be displayed in Micetro.

   * Select :guilabel:`Next: Tags`. 

   This can also be done using the AWS CLI command ``[iam|attach-role-policy]``

4. Add tags (optional):

   * Add tags to the role for organization (optional).

   * Select :guilabel:`Next: Review`.

5. Name and create role:

   * Choose a name for the role and provide a short description.

   * Select :guilabel:`Create role`.

III. Adding Inline Group Policies for Roles
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The following steps need to be performed for each account that the user should have access to.

Locate the account where the user is located. Then, find the group created in the first step of this tutorial that contains the user. Next, create a group policy in the group for each account the user needs access to, enabling them to assume the role that was created on that account.

This can be done through the AWS Management Console or by using the AWS CLI command ``[iam|put-group policy]``.

1. Add inline group policies:

   * Log in to the account containing the group with the user.

   * Open the **IAM** service.

   * Go to :guilabel:`Groups`.

   * Locate the group created in the first step and click to open it.

2. Create custom policy:

   * On the :guilabel:`Permissions` tab, create a new inline policy (not a managed policy).

   * Select the :guilabel:`Custom Policy` option and select :guilabel:`Select`.

3. Define the policy:

   * Specify a policy name.

   * Paste the provided policy document, replacing "123456789012" with the account ID of the role's location and "RoleName" with the role's name.

   * Select :guilabel:`Apply Policy`.

.. code-block::

  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "arn:aws:iam::123456789012:role/RoleName"
        }
    ]
  }


After Configuring the Accounts
------------------------------
Once you have added policies to the group for all roles, you can add the accounts to Micetro using the API credentials of the user in the group. Please note that it may take a few minutes for the AWS backend to propagate the changes. For detailed instructions on adding AWS accounts to Micetro, refer to the provided documentation.
