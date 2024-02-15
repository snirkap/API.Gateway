def lambda_handler(event, context):
    # Message to print
    message = "Hello from AWS Lambda!"

    # Print the message
    print(message)

    return {
        'statusCode': 200,
        'body': 'Message printed successfully.'
    }