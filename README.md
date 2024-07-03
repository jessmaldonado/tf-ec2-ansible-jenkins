# tf-ec2-ansible-jenkins
Terraform: Provision AWS EC2 (Jenkins server), user_data: Install Git and Ansible, run Ansible playbook to install Jenkins in the EC2.

Pre-requisites (Locally):
* Terraform
* AWS credentials - AWS cli

1. Files to be created:
  - main.tf
  - provider.tf
  - data-provider.tf
  - ec2_setup.sh
  - jenkins-playbook.yml

2. Once created the files, push them to the repository 

3. Locally execute terraform init, plan, apply

4. Terraform files will create an EC2 instance which, using the userdata template file (ec2_setup.sh), will install:
 - Ansible
 - Git
 - And clone this repository () to execute the playbook (jenkins-playbook.yml)

## To validate the Ansible's installations access to the ec2 /var/log/user-data.log

ansible --version

cd /user/ubuntu
- java -version
- sudo systemctl status jenkins

Check tasks playbook-installations in /var/log/     cat user-data.log  --> To watch the tasks playbook-installations

Access Jenkins by the browser: [ec2-ip]:8080 to setup Jenkins

Copy the path to get the administrator password and unlock Jenkins


At the end, destroy the AWS resources
terraform destroy --auto-approve


