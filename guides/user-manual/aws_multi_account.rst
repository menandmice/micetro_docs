.. meta::
   :description: How to connect Micetro to multiple AWS accounts using single credentials
   :keywords: credentials, AWS, Micetro

.. _aws-multi-account:

Configuring an AWS multi-account setup
======================================

Overview
--------

Micetro can be connected to multiple AWS accounts using single credentials. This is done by configuring a cloud account to be able to assume roles on other accounts. The credentials added to Micetro when adding multiple AWS cloud accounts, should belong to a user that is a member of a group. The group should be configured to allow members to assume AWS roles on other accounts with access to cloud networks(via EC2) or DNS Services(via Route53). Step-by-step instructions on how to configure this setup can be found below.

Set up and configuration
------------------------

The following steps should be taken when configuring an AWS account to assume roles on other accounts for Micetro.

I. Creating a group containing the user that should have access to the roles on the other accounts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Find a pre-existing user that you want to use, or create a new user.

This can be done through the AWS Management Console or using the AWS CLI command ``[iam|create-user]``

Open the :guilabel:`IAM service` in the management console.

..

2. Select :guilabel:`Users` from the left-hand menu or under IAM resources.

3. Either select an existing user to use, or create a new user by clicking :guilabel:`Add user` and following the steps described in the wizard. If a new user is created, make sure to allow programmatic access so that an access key ID and secret access key pair can be used to add the account to Micetro. The user must also have the IAMReadOnlyAccess policy attached. If you want to manage Route53 and VPCs on the account where the user is located, the AmazonRoute53FullAccess and AmazonEC2Full access policies should also be attached.

4. Create a group

This can be done through the AWS Management Console or by using the AWS CLI command ``[iam|create-group]``

.. note::
  Make sure this is done under the account where the user is located.

..

5. Under the *IAM* service, select :guilabel:`Groups`.

6. Select the :guilabel:`Create New Group` button.

7. You will be offered policies to attach to your group. Just press :guilabel:`Next Step`.

8. A review window will be displayed. Press :guilabel:`Create Group` to finish creating the group.

9. Add the user to the group created in the previous step. This can be done through the AWS Management Console or by using the AWS CLI command ``[iam|add-user-to-group]``

10. From the **Groups** menu under the IAM service, click on the newly created group.

11. Under the users tab, click :guilabel:`Add Users to Group`.

12. Select the checkbox next to the user that should be added to the group. This should either be the user created earlier, or a pre-existing user you've decided to use. Then click on the :guilabel:`Add Users` button.

II. For each account that the user should have access to, create and configure a role on the account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps should be performed for each account that the user should have access to.

Now a role has to be created on the accounts that the user should have access to, the role has to be assumable by the user.

This can be done through the AWS Management Console or by using the AWS CLI command ``[iam|create-role]``

1. Log in to the account that the user should have access to using the AWS Management Console.

2. Open the **IAM** service in the management console.

3. Select :guilabel:`Roles` from the menu on the left or under the IAM resource.

4. Press the :guilabel:`Create role` button.

5. Select :guilabel:`Another AWS account` as the type of trusted entity. In the Account ID window, put the account ID of the account that contains the user that should be able to access this account. Then click :guilabel:`Next: Permissions`.

6. Now attach necessary policies for Micetro to the role. You can attach the policies by searching for them by name in the search window and then checking the checkbox next to their name. After all necessary policies have been attached, click on the :guilabel:`Next: Tags` button. Micetro needs the following AWS policies to be attached.

* *AmazonRoute53FullAccess* to manage hosted DNS zones.

* *AmazonEC2FullAccess* to manage Cloud Networks and ranges.

* *IAMReadOnlyAccess* so that Micetro can access the account alias. This does not need to be attached if you do not want AWS account aliases to be displayed in Micetro.

This can also be done using the AWS CLI command ``[iam|attach-role-policy]``

7. Now you can add tags to the role. Micetro does not require any tags but they can be added optionally to help organize your account. After you finish adding tags, click on the :guilabel:`Next: Review` button.

8. Now select a name for the role that is being created and review the role before confirming the creation. After naming the role and ideally writing a short description, press the :guilabel:`Create role` button.

III. Add inline group policies to the group that contains the user for each of the roles created
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps should be performed for each account that the user should have access to.

On the account where the user that should have access to the roles is located, locate the group created in the first step of this tutorial. The group should contain the user that should have access to the roles. For each account that the user should have access to, create a group policy in the group allowing him to assume the role that was created on the account.

This can be done through the AWS Management Console or by using the AWS CLI command ``[iam|put-group policy]``

1. Log in to the account where the group is located using the AWS Management Console.

2. Open the **IAM** service in the management console.

3. Under the IAM service, select :guilabel:`Groups`.

4. Locate the group that was previously created and click on it to open up further options for the group.

5. Under the permissions tab, locate inline policies and create a new one. It is very important that the policy is created as an inline policy, a managed policy will not work.

6. Check the :guilabel:`Custom Policy` option and click on the :guilabel:`Select` button.

7. Type a name for your policy into the **Policy Name** field. Paste the following policy into the Policy Document field. Replace ``123456789012`` with the ID of the account where the role is located and replace ``RoleName`` with the name of the role that should be assumed on the account. Then click on the :guilabel:`Apply Policy` button.

.. code-block::
  :linenos:

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

After Configuring the accounts
------------------------------

After adding the policies to the group for all of the roles, the accounts can be added to Micetro using the API credentials of the user that is in the group. Further information on how to add AWS accounts to Micetro can be found here. You might need to wait a couple of minutes for the AWS backend to propagate the changes everywhere.
