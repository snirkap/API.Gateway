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
#### The following is the representation of metrics gathered by the lambda functions:
![WhatsApp Image 2024-02-28 at 15 21 18_dcb1e9f7](https://github.com/snirkap/API.Gateway/assets/120733215/96effae5-1fc6-419a-a85e-6598d870eb4e)

### Prerequisites:
* AWS Account with access to API Gateway, Lambda Functions, S3, and Amazon CloudWatch
* Terraform installed on your local machine
* Git installed on your local machine
* awscli installed on your local machine

## Setup and Deployment:
### Clone the Repository
First, clone this repository to your local machine to get started with the project.
```
git clone https://github.com/snirkap/API.Gateway.git
cd API.Gateway
```
### Terraform Initialization and Application
Navigate to the modules directory within the cloned repository and run the following command to initialize Terraform, allowing it to download necessary providers and modules.
and change this variable:
* s3_bucket_name
```
terraform init
terraform apply -var="s3_bucket_name=your-bucket-name"
```
