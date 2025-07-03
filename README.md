🚀 𝐒𝐮𝐜𝐜𝐞𝐬𝐬𝐟𝐮𝐥𝐥𝐲 𝐀𝐮𝐭𝐨𝐦𝐚𝐭𝐞𝐝 𝐀𝐖𝐒 𝐈𝐧𝐟𝐫𝐚𝐬𝐭𝐫𝐮𝐜𝐭𝐮𝐫𝐞 𝐃𝐞𝐩𝐥𝐨𝐲𝐦𝐞𝐧𝐭 𝐰𝐢𝐭𝐡 𝐉𝐞𝐧𝐤𝐢𝐧𝐬 + 𝐓𝐞𝐫𝐫𝐚𝐟𝐨𝐫𝐦 🎯

🔧 Tools & Technologies Used

    Terraform
    
    AWS (EC2, VPC, Security Group, etc..)

    Jenkins

    GitHub
    
    
    
📌 Project Architecture

GitHub holds the Terraform code.

Jenkins is configured to automatically pull the code and execute a pipeline.

Jenkins triggers Terraform commands to provision infrastructure in AWS.

🚀 Step-by-Step Workflow

1️⃣ Write Terraform Code

I wrote Terraform scripts to provision:

A VPC

A public subnet

An Internet Gateway

A Route Table

A Security Group (allowing SSH & HTTP)

An EC2 Instance with a key pair

2️⃣ Push Code to GitHub

Created a new GitHub repository

Committed and pushed all Terraform files into it

3️⃣ Set Up Jenkins Server

Provisioned a new EC2 instance

Installed:

Jenkins

Git

Terraform

Enabled port 8080 for Jenkins access

4️⃣ Configure Jenkins Pipeline

Created a new Pipeline Job in Jenkins

Configured GitHub webhook (optional, for automation)

5️⃣ Trigger Jenkins Build

Manually or via GitHub webhook

Jenkins pulled the latest Terraform code and triggered the pipeline

AWS resources were automatically provisioned




