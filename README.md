# API.Gateway
## Overview:
This project aims to provide a simple RESTful API gateway utilizing AWS services, specifically AWS API Gateway, AWS Lambda, Amazon S3, and Amazon CloudWatch. It consists of two Lambda functions orchestrated via Terraform scripts to handle different aspects of a web application.
### Project Components:
1. API Gateway:
   * AWS API Gateway acts as the entry point for the RESTful API. It manages HTTP requests and routes them to appropriate Lambda functions based on defined endpoints.
2. Lambda Functions:
   * Name and Phone Collection:
     * This Lambda function captures data submitted via a web form, specifically user names and phone numbers.
     * Upon receiving a request, it processes the data and stores it in an S3 bucket for future reference.
  
  * Button Click Metric:
      * Responsible for tracking button clicks on the website, this Lambda function receives the name of the clicked button.
      * It increments a CloudWatch metric associated with the respective button, tallying each click with an increment of 1.

### Technologies Used:
* Terraform
* AWS Lambda
* AWS API Gateway
* Amazon S3
* Amazon CloudWatch
