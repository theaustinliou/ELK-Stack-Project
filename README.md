# ELK-Stack-Project
All the files associated with chapter 13: The ELK-Stack
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

ELK_Stack_Diagram.pdf

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - install-elk.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting traffic to the network.
- Load balancers protect the availability and usability of servers, as they evenly distribute traffic among multiple servers to ensure that no single server gets overloaded with traffic, which becomes especially useful in the case of a denial of service attack. The advantage of a jump box is that it acts as the gateway between the public internet and our virtual network of VM's, controlling access to these machines by properly filtering traffic to whatever specifications we desire.  


Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system metrics.
- Filebeat is used to collect data to generate and organize log files to be sent to elasticsearch and logstash.
- Metricbeat is used to record machine metrics and statistics such as uptime or CPU usage from the operating system and services in order to be sent to elasticsearch or logstash.

The configuration details of each machine may be found below.


| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.7   | Linux            |
| Web-1    | webserver| 10.0.0.8   | Linux            |
| Web-2    | webserver| 10.0.0.9   | Linux            |
| ELK-VM   |ELK-server| 10.1.0.5   | Linux            |
               
### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jump box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 104.172.108.110

Machines within the network can only be accessed by the jump box.
- I only gave ELK-VM access to my local machine since I do not want it publicly accessible, which has the IP address 104.172.108.110.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | No                  | 104.172.108.110      |
| ELK-VM   | No                  | 104.172.108.110      |
|          |                     |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because we can repeat this process for any other machines that require ELK configuration in the future without having to manually reconfigure any kind of setup.
- Additionally, if any future changes are to be made in the setup process for an ELK machine, instead of rebuilding the playbook from the ground up, we can simply edit it and add/delete whatever we need to.

The playbook implements the following tasks:
- First step is to install docker along with its constituents (such as the Docker module) so that we can properly set up our ELK container.
- The next step then ensures that our target VM uses more memory, which is requires for our ELK container to run.
- After allocating this extra memory for our VM, the next task must download and launch the "sebp/elk:761" Docker container. This implies that sebp was the organization responsible for crearting the container, elk is the type and 761 is the version.
- The very last step utilizes systemd to ensure that the docker service is enabled on boot, meaning that the container will still be running even if our ELK-VM is restarted.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

Docker_ps_image.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.8, 10.0.0.8

We have installed the following Beats on these machines:
- Filebeat, Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat allows us to collect data from the file system by monitoring and indexing logs of our webserver to be used whenever. Metricbeat collects all sorts of metric data for our webserver such as uptime and CPU usage to be used whenever. Both of these beats send their collections of data to be organized in Elasticsearch or Logstash.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the beat configuration file to the webservers.
- Update the hosts file to include the IP address of the ELK-VM and both webservers.
- Run the playbook, and navigate to the ELK-VM to check that the installation worked as expected.


- The playbook files are the three different YAML files we set up in order to properly automate the configuration of the ELK container, filebeat, and metricbeat. These files should have been copied to our roles directory within the ansible file of our jump box.
- We need to update our hosts file in order to specify different groups: namely a webservers group which includes the ip addresses of the webservers along with an elk group that includes the ip address of our ELK-VM. If this is done properly, we can indicate which machines are the designated targets of each of our playbooks within the playbooks themselves. We would want the elk-installation playbook to include only the elk group, while the filebeat and metricbeat playbooks need to include the webservers group. 
- We would navigate to "http://[your.ELK-VM.External.IP]:5601/app/kibana", where in this case the IP address of this ELK-VM is 20.150.141.244, in order to see if our ELK-server is up and running. 
