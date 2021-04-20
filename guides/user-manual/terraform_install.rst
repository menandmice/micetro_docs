.. _terraform-install:

Installing the Micetro provider for Terraform
=============================================

Manual Build and Install
------------------------

Mac or Linux
------------

make install

Windows
-------

1. Build and install the provider:

.. code-block:: shell

  go build -o terraform-provider-menandmice

2. Copy the ``terraform-provider-menandmice`` binary:

  * for Terraform 0.12: ``%APPDATA%\terraform.d\plugins\windows_amd64\``

  * for Terraform 0.13: ``%APPDATA%\terraform.d\plugins\terraform-provider-menandmice\local\menandmice\0.2\windows_amd64\``

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
