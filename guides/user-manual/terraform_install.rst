.. meta::
   :description: How to install the Micetro by Men&Mice provider for Terraform 
   :keywords: Micetro 

.. _terraform-install:

Installing the Micetro provider for Terraform
=============================================

Download compiled binaries
--------------------------

Precompiled binaries for Windows and Linux are available on `the Men&Mice download server <https://download.menandmice.com/opensource/terraform/>`_.

Manual Build and Install
------------------------

Mac or Linux
------------

make install

Windows
-------

1. Build and install the provider:

.. code-block:: shell

  go build -o terraform-provider-menandmice.exe

2. Copy the ``terraform-provider-menandmice.exe`` to:

  * for Terraform 0.12: ``%APPDATA%\terraform.d\plugins\windows_amd64\``

  * for Terraform 0.14: ``%APPDATA%\terraform.d\plugins\registry.terraform.io\local\menandmice\0.2.0\windows_amd64\``

3. Initialize:

.. code-block:: shell

  terraform.exe init 

Run acceptation test
--------------------

Define the Micetro server:

::

  dnsserver: micetro.example.net. micetro.example.com.
  dhcpserver: micetro.example.net.
  ipam-properties: location

Set provider settings that are not set in ``main.tf``:

.. code-block:: bash

  export MENANDMICE_ENDPOINT=<api-endpoint>
  export MENANDMICE_USERNAME=<your username>
  export MENANDMICE_PASSWORD=<your password>

And make a test account:

.. code-block:: bash

  make testacc

For using the Micetro provider, see :ref:`terraform-usage`.
