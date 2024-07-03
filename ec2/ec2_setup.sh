# Set up server

exec > >(tee -i /var/log/user-data.log)  ## This ensures that all subsequent commands in the script will have their output logged to /var/log/user-data.log
exec 2>&1

sudo apt update -y
supo apt install software-properties-common
sudo add-apt-repository --yes  --update ppa:ansible/ansible
sudo apt install ansible -y
sudo apt install git -y
mkdir Ansible && cd Ansible
pwd
## Clone my repo
git clone https://github.com/jessmaldonado/tf-ec2-ansible-jenkins.git
cd ANSIBLE
ansible-playbook -i localhost jenkins-playbook.yml 