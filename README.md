# API.Gateway
## Here you can see a diagram explaining the project:
![api_getway_diagram drawio](https://github.com/snirkap/API.Gateway/assets/120733215/140f2881-3976-458f-a462-cffd6a707210)

## Overview:
This project aims to provide a simple RESTful API gateway utilizing AWS services, specifically AWS API Gateway, AWS Lambda, Amazon S3, and Amazon CloudWatch. It consists of two Lambda functions orchestrated via Terraform scripts to handle different aspects of a web application.
### Project Components:
1. **API Gateway**:
   - The AWS API Gateway serves as the entry point for the RESTful API, managing HTTP requests and routing them to appropriate Lambda functions based on defined endpoints.

2. **Lambda Functions**:
   - **Name and Phone Collection**:
     - This Lambda function captures data submitted via a web form, specifically user names and phone numbers. Upon receiving a request, it processes the data and stores it in an S3 bucket for future reference.
   - **Button Click Metric**:
     - Responsible for tracking button clicks on the website, this Lambda function receives the name of the clicked button. It increments a CloudWatch metric associated with the respective button, tallying each click with an increment of 1.

3. **Amazon S3**:
   - S3 buckets are utilized for storing data submitted through the web form. The "Name and Phone Collection" Lambda function deposits this data into the designated S3 bucket for storage and retrieval.

4. **Amazon CloudWatch**:
   - CloudWatch is used for monitoring and logging various metrics related to the system's behavior. Metrics are recorded for button clicks, providing insights into user interaction with the website. Additionally, a dashboard is created in CloudWatch to visualize and analyze these metrics over time.
#### Here you can see the dashboard we created:
![WhatsApp Image 2024-02-28 at 15 21 18_dcb1e9f7](https://github.com/snirkap/API.Gateway/assets/120733215/dfc537ab-1391-42e3-aa7b-f421676a1406)


### Technologies Used:
* Terraform
* AWS Lambda
* AWS API Gateway
* Amazon S3
* Amazon CloudWatch
