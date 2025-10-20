# Deploy Angular Static App Infrastructure
$STACK_NAME = "angular-static-app"
$GITHUB_REPO = "ssm1990/aws-cldfn-angs"
$GITHUB_CONNECTION_ARN = "arn:aws:codeconnections:ap-south-1:314129306412:connection/4a9ee36f-b5e7-4b9b-913b-d7175ad26362"  # Replace with your actual Connection ARN

aws cloudformation delete-stack --stack-name $STACK_NAME --region ap-south-1
Start-Sleep -Seconds 60

aws cloudformation deploy `
  --template-file infrastructure/infrastructure.yml `
  --stack-name $STACK_NAME `
  --parameter-overrides `
    GitHubRepo=$GITHUB_REPO `
    GitHubConnectionArn=$GITHUB_CONNECTION_ARN `
  --capabilities CAPABILITY_IAM `
  --region ap-south-1

Write-Host "Deployment initiated. Check AWS Console for progress."
