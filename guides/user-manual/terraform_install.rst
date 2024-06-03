.. meta::
   :description: How to install the Micetro provider for Terraform 
   :keywords: Micetro provider, Terraform, binaries

.. _terraform-install:

Installing the Micetro Provider for Terraform
=============================================

Download Compiled Binaries
--------------------------

Precompiled binaries for Windows and Linux are available on `the Terraform Registry <https://registry.terraform.io/providers/menandmice/menandmice/latest/>`_.

Manual Build and Install
------------------------

For Mac or Linux
^^^^^^^^^^^^^^^^
* Run the following command to build and install the provider:

  .. code-block:: shell

    make install

For Windows
^^^^^^^^^^^

1. Build the provider by running:

   .. code-block:: shell

     go build -o terraform-provider-menandmice.exe

2. Copy the ``terraform-provider-menandmice.exe`` file to the appropriate directory based on your Terraform version:

  * For Terraform 0.12:

   ::

   ``%APPDATA%\terraform.d\plugins\windows_amd64\``

  * For Terraform 0.14:

   ::

   ``%APPDATA%\terraform.d\plugins\registry.terraform.io\local\menandmice\0.2.0\windows_amd64\``

3. Initialize Terraform:

   .. code-block:: shell

     terraform.exe init 

Run Acceptance Test
--------------------

1. Define the Micetro server settings in your configuration file:

   ::

     dnsserver: micetro.example.net. micetro.example.com.
     dhcpserver: micetro.example.net.
     ipam-properties: location

2. Set the provider environment variables:

   .. code-block:: bash

     export MENANDMICE_ENDPOINT=<api-endpoint>
     export MENANDMICE_USERNAME=<your username>
     export MENANDMICE_PASSWORD=<your password>

3. Create a test account by running:

   .. code-block:: bash

     make testacc

For more details on using the Micetro provider, see :ref:`terraform-usage`.
