import boto3

def lambda_handler(event, context):
    # Increment custom metric in CloudWatch
    cloudwatch = boto3.client('cloudwatch')
    try:
        response = cloudwatch.put_metric_data(
            Namespace='countClick',  
            MetricData=[
                {
                    'MetricName': 'ButtonClickedCount',
                    'Dimensions': [
                        {
                            'Name': 'Button',
                            'Value': 'SpecificButton'
                        }
                    ],
                    'Unit': 'Count',
                    'Value': 1
                }
            ]
        )
        print("Custom metric updated successfully")
    except Exception as e:
        print(f"Error updating custom metric: {e}")

    return {
        'statusCode': 200,
        'headers': {
            'Access-Control-Allow-Origin': '*',  
            'Access-Control-Allow-Headers': 'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token',
            'Access-Control-Allow-Methods': 'GET,OPTIONS,POST,PUT'
        },
        'body': 'Metric updated successfully'
    }
