# FSL DevOps Challenge: Part 1

## **Continuous integration**

Set up a new repository and CI pipeline using any code version provider specified below:

- Github Actions
- Gitlab CI/CD
- CircleCI
- Azure DevOps

The CI steps should be created and triggered for any pull request. The pipeline should run the following steps:

- Install dependencies npm install
- Linter (ESLint) npm run lint
- Formatter (Prettier) npm run prettier
- Test (Jest) CI=true npm run test
- Build npm run build

The pipeline should be successful. 

Please provide some pull requests to show pass or fail status in the CI pipeline.

# FSL DevOps Challenge: Part 2

## Test the application locally

Run the application locally using the Kubernetes platform with docker-desktop, minikube, or any application that creates a local cluster of Kubernetes.

The application must be deployed on Kubernetes using manifest files and must follow the requirements below:

1. The service and deployment resources must be hosted in a namespace called production
2. The service resource must listen on port 8080
3. The application should have an env name called MY_SECRET that gets the value from the Kubernetes secrets resource. The value should be ‘On3H1torL3sS`
4. The application must be available with the name http://fsl-challenge.me, pointing to your localhost

## Continuous Deployment

Deploy the application in your AWS account using any services that run the application as Docker Container.

The application just needs to be:

1. Available for anyone with Internet access only during the challenge recording
