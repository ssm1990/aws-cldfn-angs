# Angular Static App CI/CD Pipeline

This project implements a CI/CD pipeline for an Angular static application with:
- GitHub source control (via AWS CodeStar connection)
- AWS CodeBuild for building the Angular app
- AWS CodePipeline for CI/CD orchestration
- S3 for static website hosting
- CloudFront for CDN distribution

## Setup Instructions

1. **Prerequisites:**
   - AWS CLI configured with appropriate permissions
   - GitHub repository created (e.g., `ssm1990/aws-cldfn-angs`)
   - AWS CodeStar connection to your GitHub repository (created in AWS Developer Tools console)

2. **Create AWS CodeStar Connection:**
   - Go to AWS CodeStar Connections in the AWS Console
   - Create a new connection to GitHub
   - Authorize the connection with your GitHub account
   - Note the Connection ARN (starts with `arn:aws:codestar-connections:`)

3. **Update Configuration:**
   - Edit `deploy.sh` (Linux/Mac) or `deploy.ps1` (Windows) with your GitHub repository details and Connection ARN
   - Modify `infrastructure/infrastructure.yml` parameters if needed (e.g., branch name)

4. **Deploy Infrastructure:**
   ```bash
   ./deploy.sh
   ```
   or
   ```powershell
   .\deploy.ps1
   ```

5. **Push Code:**
   - Push your Angular code to the specified GitHub repository and branch
   - The pipeline will automatically trigger, build, and deploy the application

## Architecture Components

- **GitHub**: Source code repository with CodeStar connection for secure access
- **CodePipeline**: Orchestrates the CI/CD process with source, build, and deploy stages
- **CodeBuild**: Builds the Angular application using Node.js and npm
- **S3**: Hosts the static website files with public read access
- **CloudFront**: CDN for global distribution and caching of static assets

## Outputs

After deployment, the CloudFormation stack provides:
- Website URL via CloudFront distribution
- S3 bucket name for direct access (if needed)

## Project Structure

- `infrastructure/infrastructure.yml`: CloudFormation template for AWS resources
- `buildspec.yml`: CodeBuild specification for building the Angular app
- `deploy.sh` / `deploy.ps1`: Deployment scripts
- `src/`: Angular application source code
- `dist/`: Built application output (generated during build)