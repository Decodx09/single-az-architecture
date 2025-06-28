Diagram - 

![Screenshot 2025-06-29 at 1 57 43 AM](https://github.com/user-attachments/assets/b647be99-989d-44ec-92dc-edceb49d6a93)

So,the following architecture is a good start to get started with AWS Infrastructure: 

It has a VPC ( Virtual Private Connection ) and has 3 subnets.
 
Public Subnet which has NAT Gateway, a Jump Server and an Application load balancer.

1st Private Subnet has a Jenkins CI/CD Server and 3 Application Server. 

2nd Private Subnet has a database with a standby database.

Jump Server (Bastian Server) is being used to access the Application Server so we could configure it, and by configure it I mean you can access your Servers only through the Jump Server that’s the purpose of it.


User can access the application through the S3 Frontend which is connected to the CDN called Cloudfront which redirects the request towards the load balancer and load balancer redirects
the request towards the Application server. 

Application server redirects the request towards the Database and either fetches or pushes the data.

Let’s get into the Application server.


First spin up the server there you need to pull your Git repository, install Docker. create an image of the following application or if your application is in the Docker registry already pull it. and create an image of the Application server. 

Now go to the auto scaling group, set the minimum number of servers as 3 for an example and select the image.

Set the target group, create an Application Load Balancer. Uhm now at this point use the curl command to test your Application and check the IP it would change which shows that your Application Load Balancer is working.

Upload your Frontend to a S3 Bucket, and attach CDN to it. make sure your links to your Application Load Balancers are attached to it.

Now test it. 

Prepare a load testing file, I would suggest either to use Node canon or shell script. File is in the repository which I have shared. 


That way you would learn how your database is responding. I've always loved it.

