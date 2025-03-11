.. meta::
   :description: Installing the AuthServe DNS Agent for Micetro
   :keywords: DNS, DNS Agent, Micetro, AuthServe

.. _authserve:   

Installing the AuthServe Agent
==============================
  
1. Setting up the Agent
-----------------------
Download the latest package from https://download.menandmice.com/ and extract the installer into ``/var/mmsuite``. You can choose a different location for the agent, if preferred.
  
.. code-block::
 
   mkdir -p /var/mmsuite && cd /var/mmsuite

   # Assuming the package is in local directory
   tar oxzf ./mm-authserve-agent.tar.gz

   # Ensure that the user running the service owns the agent files 
   chown ${SUDO_USER:-$USER}: -R mm-authserve-agent

   # Enter the extracted directory and proceed to configure the agent
   cd mm-authserve-agent

2. Installing the Agent
-----------------------

   1. Install the agent as a service with ``sudo ./install``. Note that the install script requires Python. Make sure that the user that runs the install script is the same user that owns the ``mm-authserve-agent`` folder.
   2. Copy the agent setup key that the install script prints out.
   3. The Micetro AuthServe Agent should now be up and running, but you need to connect it to Central to be able to manage it through Micetro.

.. note::
   The Micetro AuthServe Agent runs on port ``50051`` and Central runs on port ``1231``. Ensure that no firewall settings prevent connection from Central to the agent.
   
3. Adding the Agent to Central
------------------------------
   1. On the top navigation menu, select :guilabel:`Admin`.
   2. Select the :guilabel:`Service Management` tab.
   3. Select :guilabel:`Add Service` on the task bar.
   4. From the list of services, select **AuthServe**.
   5. Open the :guilabel:`New Agent` tab, and enter the required information.
   
       .. image:: ../../images/add-authserve.png
          :width: 65%
      
      * **Agent host**: The hostname or IP address of the machine where the agent is located. Note that the Central machine must be able to communicate with the agent machine. 
      * **Agent display name**: (Optional) Enter an agent display name if you want your agent to be displayed in the UI under some other name than the hostname/IP address.
      * **Agent setup key**: Enter the setup key for the agent that you copied earlier from the agent installation script. If you forgot to copy it, you can also find it located in the SSL directory under the agent directory on the agent machine. The agent also prints it out upon startup if it hasn’t been added to a Central server yet. The setup key is used to encrypt certificates that Central sends to the agent. These certificates are then used to allow for theh creation of a secure encrypted connection between Central and the agent.

      .. note::
         If the agent you are adding to Central has been previously added to a Central server, you need to remove the SSL directory and restart the agent first. The restart will generate a new setup key that you should use when adding the agent.


   6. When you are finished, click :guilabel:`Next`.
   7. Enter :guilabel:`Service name` and the Nominum Command Channel used to connect to ANS in the :guilabel:`Channel` box. If there are custom properties defined for DNS servers in your Micetro setup, you can enter the values for them in this step. 
   8. Select :guilabel:`Add`.

Micetro should now have a secure connection to the Micetro AuthServe Agent and you should be able to manage your AuthServe DNS server.

4. Updating the Agent
---------------------
Currently, the ``mmupdater`` service is not capable of updating the AuthServe agent, so the update process must be done manually. To update the agent, an Administrator must unzip the latest agent package and run the ``update.sh`` script. 
