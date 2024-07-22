#!/bin/bash
yum install httpd -y
service httpd start
chkconfig httpd on 
echo " <html>
<head>
<style>
h2{
  text-align: center;
  padding: auto;
  font-size: 70px;
}
h3{
  text-align: center;
  padding: auto;
  font-size: 50px;
}
</style>
</head>
<body>
<h2> Hey Myself Bhaskar Completed First Project </h2>
<h3>Replace this code with your project code.</h3>
<h3>Upload your code into S3 Bucket and retreive it.</h3>
</body>
</html> " > /var/www/html/index.html