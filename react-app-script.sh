bash script
#! bin/bash

-------------------------------------------------------------------------------------------------------------------
#This script automates the process of deploying a react application to development server built on an Ec2 instance.
-------------------------------------------------------------------------------------------------------------------

#STEP 1: UPDATE THE LINUX INSTANCE (COULD BE UBUNTU, RHEL, FEDORA OR AMAZON AMI). DEPENDING ON YOUR DISTRIBUTIONS, 
	
	#USE THE APPROPRIATE PACCKAGE MANAGER. IN THIS TUTORIAL WE MAKE USE OF THE AMAZON LINUX AMI THAT USES 'YUM'
	
	Sudo yum update
	
	#You may wish to upgrade your OS if you wish (optional)
	
	sudo yum upgrade

#STEP 2: INSTALL NODEJS FOR YOUR LINUX OS (CHECKOUT THE AWS OFFICIAL DOCUMENTATION: https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/setting-up-node-on-ec2-instance.html)
	
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash # This installs node version manager (nvm).

	# IF "CURL NOF FOUND" ERROR DISPLAYS, THEN YOU WILL NEED TO INSTALL CURL
	
	sudo yum install curl #(If you dont get the error please move on to the next command)
	
	# Activate NVM
	
	. ~/.nvm/nvm.sh
	
	#Install node now
	
	nvm install node
	
	#Confirm version of node (OPTIONAL)
	
	node -v

#STEP 3: INSTALL NGINX OR APACHE WEBSERVER
	
	#For Apache: 
	
	sudo yum install httpd
	
	#For Nginx. (If you're using AWS Linux2, you have to install nginx from the AWS "Extras Repository".)
	
	sudo amazon-linux-extras install nginx1.12
	
	#Start the webserver after installation
	
	sudo systemctl start nginx 
	
	sudo systemctl status nginx
	
	sudo systemctl enable nginx

#STEP 4: Navigate into the /var/www/html directory
	
	cd /var/www/html
	
	#change directory permissions to grant read,write access to webserver
	
	chmod ugo+rwx # NOTE:Best practice is to grant the least priviledge in production environments

#STEP 5: CREATE REACT PROJECT
	
	npx create-react-app "app name" #Replace "app name" with name of react application
	
	#Navigate into the newly created app project folder and run the start command to start app
	
	npm start

#Note: Remember to edit inbound rules in your Ec2 security group to allow SSH, HTTP (port 80), HTTPS (port 443) and Custom TCP (port 300) traffic





