.. _webui-ssl:

Setup SSL for the Web Application
---------------------------------

By default, the Web Application uses unencrypted http connection on port 80. To use it with https on port 443, follow these steps.

Check that mod_ssl for Apache is installed:

.. code-block:: bash

  yum install mod_ssl

If you have existing SSL key files: place the .key file in /etc/pki/tls/private/ and the .crt and .csr files in /etc/pki/tls/certs/.

If you need new SSL keys, generate a keypair:

.. code-block:: bash

  openssl req -new -nodes -keyout mmweb.key -out mmweb.csr -newkey rsa:4096

Create self-signed certificate:

.. code-block:: bash

  openssl x509 -req -days 365 -in mmweb.csr -signkey mmweb.key -out externaldns3.crt

Place the files in the appropriate directories:

.. code-block:: bash
  :linenos:

  cp mmweb.key /etc/pki/tls/private/
  cp mmweb.c* /etc/pki/tls/certs/

Once the keyfiles are placed in their respective directories, edit the mmweb.conf file in the Apache configuration directory (default /etc/httpd/conf, or use find /etc/ -name "mmweb.conf" to locate the file) with the following changes:

* change ``<VirtualHost *:80>`` to ``<VirtualHost *:443>``
* add in the references to the key files (amend the path as necessary):
    ``SSLCertificateFile /etc/pki/tls/certs/mmweb.crt``
    ``SSLCertificateKeyFile /etc/pki/tls/private/mmweb.key``
* enable SSL:

.. code-block::

    SSLEngine on
    SSLProtocol all -SSLv2 -SSLv3
    SSLCipherSuite HIGH:3DES:!aNULL:!MD5:!SEED:!IDEA

.. note::
  The default Apache installation may already have a ``<VirtualHost _default_:443>`` directive, which can conflict with the ``mmweb.conf`` file.
  Comment out this existing VirtualHost block to prevent any errors.

To verify the Web Application is accessible, navigate to https://web-application.domain.tld. The Men&Mice Web Application’s login panel should appear.
