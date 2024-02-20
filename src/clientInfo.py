import json
import time
import boto3
import uuid

s3 = boto3.client('s3')

def lambda_handler(event, context):
    try:
        body = json.loads(event['body'])
        name = body['name']
        phone_number = body['phoneNumber']

        # Your S3 bucket name
        bucket_name = 'client-info-stand-il'

        # Create a unique key for each submission, you can use UUID or any other method
        key = f"{int(time.time())}-{uuid.uuid4()}.json"

        # Upload data to S3
        s3.put_object(
            Bucket=bucket_name,
            Key=key,
            Body=json.dumps({'name': name, 'phoneNumber': phone_number}),
            ContentType='application/json'
        )

        return {
            'statusCode': 200,
            'body': json.dumps({'message': 'Data successfully stored in S3'})
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }