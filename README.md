# API.Gateway
## Overview:
This project aims to provide a simple RESTful API gateway utilizing AWS services, specifically AWS API Gateway, AWS Lambda, Amazon S3, and Amazon CloudWatch. It consists of two Lambda functions orchestrated via Terraform scripts to handle different aspects of a web application.
### Functionality:
1. Name and Phone Collection:
   * The first Lambda function is designed to capture data from a web form where users input their name and phone number.
   * Upon receiving a request, the Lambda function extracts the data and stores it in an S3 bucket for later retrieval.
2. Button Click Metric:
   * The second Lambda function tracks button clicks on the website. It receives the name of the button clicked and increments a CloudWatch metric associated with that button.
   * The metric value is incremented by 1 every time a button is clicked.
### Technologies Used:
* Terraform
* AWS Lambda
* AWS API Gateway
* Amazon S3
* Amazon CloudWatch
