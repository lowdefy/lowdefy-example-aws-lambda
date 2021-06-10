# Lowdefy example AWS Lambda

Lowdefy apps can be deployed to AWS Lambda serverless functions by using the [lowdefy/lowdefy-aws-lambda](https://hub.docker.com/repository/docker/lowdefy/lowdefy-aws-lambda) Docker images. These images contain a Lowdefy app server. To deploy to AWS Lambda a new image that contains the app configuration, based on the Lowdefy base image, should be built. This image should then be pushed to a private AWS ECR registry. From there it can be used to create a Lambda function.

## Deploying to AWS Lambda

### Requirements

- The [AWS CLI](https://aws.amazon.com/cli/) should be installed and authenticated.
- You should have [Docker](https://docs.docker.com/get-docker/) installed.

Deploy to AWS by running:
```
npx serverless deploy --verbose --conceal --stage dev
```

This will create a ECR registry if it does not exist, and deploy an AWS Lambda function with a API Gateway HTTP api integration.

