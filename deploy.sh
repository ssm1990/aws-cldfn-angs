#!/bin/bash

# Deploy Angular Static App Infrastructure
STACK_NAME="angular-stat-app"
GITHUB_REPO="ssm1990/aws-cldfn-angs"
GITHUB_CONNECTION_ARN="arn:aws:codestar-connections:ap-south-1:314129306412:connection/20b824e1-13a6-4583-9295-2d6156bdc345"  # Replace with your actual Connection ARN

aws cloudformation deploy \
  --template-file infrastructure/infrastructure.yml \
  --stack-name $STACK_NAME \
  --parameter-overrides \
    GitHubRepo=$GITHUB_REPO \
    GitHubConnectionArn=$GITHUB_CONNECTION_ARN \
  --capabilities CAPABILITY_IAM \
  --region ap-south-1

echo "Deployment initiated. Check AWS Console for progress."