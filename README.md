## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Diagrams/network-diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Ansible file may be used to install only certain pieces of it, such as Filebeat.

(Ansible/DVWA-playbook.yml)
(Ansible/Elk-playbook.yml)
(Ansible/filebeat-playbook.yml)
(Ansible/metricbeat-playbook.yml)

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly accessible, in addition to restricting traffic to the network.

What aspect of security do load balancers protect?
- Load balancers are extremly important to make sure no single server bears too much demand. This also helps protect again DDoS attacks.

What is the advantage of a jumpbox?
- This cloud network has a jump box that admins can connect to to do work on any of the webservers. The advantage of a jumpbox is that it makes it easier to manage devices and adds an extra layer of security to ensure there won't be any unauthroized access.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
What does Filebeat watch for?
- Filebeat watchs log files or locations that is set by the user, collects log events and forwards them to either Elasticsearch or Logstash
What does Metricbeat record?
- Metricbeat takes the metrics and statistics that are collected and sends them to either Elasticsearch or Loagstash. The destination is determined by the user. 

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name                 | Function   | IP Address              | Operating System |
|----------------------|------------|-------------------------|------------------|
| Jump-Box-Provisioner | Gateway    | 10.0.0.5/52.186.141.254 | Linux            |
| Web-1                | Web Server | 10.0.0.8                | Linux            |
| Web-2                | Web Server | 10.0.0.9                | Linux            |
| Web-3                | Web Server | 10.0.0.10               | Linux            |
| Elk-Stack            | ELK Server | 10.1.0.4/40.75.24.104   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Elk Server machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Workstation Public IP through TCP 5601

Machines within the network can only be accessed by the Jump-Box-Provisioner.
Which machine did you allow to access your ELK VM? What was its IP address?
- Jump-Box-Provisioner IP 10.0.0.5 via SSH port 22
- Workstation Public IP via port TCP 5601

A summary of the access policies in place can be found in the table below.

| Name                 | Public Accessible | Allowed IP Addresses  |
|----------------------|-------------------|-----------------------|
| Jump-Box-Provisioner | No                | Workstation Public IP |
| Web-1                | No                | 10.0.0.5              |
| Web-2                | No                | 10.0.0.5              |
| Web-3                | No                | 10.0.0.5              |
| Elk-Stack            | No                | Workstation Public IP |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Ansible is simple in the fact that you don't need special coding skills to have powerful configuartion mangement and app deployment. You simply list the tasks you want done by writing a playbook and Ansible will get the systems specified to the state you want them in

The playbook implements the following tasks:
- Specify a group of machines for the playbook to be applied towards
- Increases System Memory
- Installs services like docker.io, python3-pip and docker
- Downloads the elk container from the image sebp/elk:761
- Exposes the container to ports 5601, 9200, and 5044

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(Images/elk-ps.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 : 10.0.0.8
- Web-2 : 10.0.0.9
- Web-3 : 10.0.0.10

We have installed the following Beats on these machines:
- Elk Stack, Web-1, Web-2, and Web-3
- Both Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects log events such as system logs, wifi logs and even error logs that are indexed and can be later reviewed. Metricbeat helps monitor the servers by collecting metrics from services running. It can collect information on services like Apache and MySQL.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the /etc/ansible/files/filebeat-config.yml file to /etc/filebeat/filebeat-playbook.yml.
- Update the filebeat-config.yml file to include...
- The IP address of the Elk Server
- Run the playbook, and navigate to System logs in Kibana to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?
- The file is filebeat-playbook.yml. You can find it at (Ansible/filebeat-playbook.yml)
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- You need to update the hosts file to include the IP address for the specific group you want the playbook to run on. To specify which group you want a playbook to run on, you simply need to go into the filebeat-playbook.yml and on the 3rd line change the hosts to the specfic group you want it run on.
- _Which URL do you navigate to in order to check that the ELK server is running?
- Navigate to http://[your.ELK-VM.External.IP]:5601/app/kibana#/home

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
