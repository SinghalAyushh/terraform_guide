# # Creating an AWS instance for the MySQL! It should be launched in the private subnet!
# resource "aws_instance" "MySQL" {
#   depends_on = [
#     aws_instance.webserver,
#   ]

#   # Using my custom Private AMI which has most of the things configured for WordPress
#   # i.e. MySQL Installed!
#   ami = "ami-0f70942519a84d179"
#   instance_type = "t2.micro"
#   subnet_id = aws_subnet.subnet2.id

#   # Keyname and security group are obtained from the reference of their instances created above!
#   key_name = "MyKeyFinal"

#   # Attaching 2 security groups here, 1 for the MySQL Database access by the Web-servers,
#   # & other one for the Bastion Host access for applying updates & patches!
#   vpc_security_group_ids = [aws_security_group.MySQL-SG.id, aws_security_group.DB-SG-SSH.id]

#   tags = {
#    Name = "MySQL_From_Terraform"
#   }
# }


# # Creating an AWS instance for the Bastion Host, It should be launched in the public Subnet!
# resource "aws_instance" "Bastion-Host" {
#    depends_on = [
#     aws_instance.webserver,
#      aws_instance.MySQL
#   ]
  
#   ami = "ami-0162dd7febeafb455"
#   instance_type = "t2.micro"
#   subnet_id = aws_subnet.subnet1.id

#   # Keyname and security group are obtained from the reference of their instances created above!
#   key_name = "MyKeyFinal"
   
#   # Security group ID's
#   vpc_security_group_ids = [aws_security_group.BH-SG.id]
#   tags = {
#    Name = "Bastion_Host_From_Terraform"
#   }
# }