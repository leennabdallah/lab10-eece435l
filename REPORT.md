# Lab 10 Report: Jenkins CI/CD Pipeline

## Changes made to the Jenkinsfile

1. **Coverage stage**: runs `coverage run --source=app -m pytest` followed by
   `coverage report -m` to measure how much of `app.py` is exercised by the tests.
   `coverage` was added to `requirements.txt`.
2. **Security Scan stage**: runs `bandit -r app.py` to look for common security
   issues in the code. `bandit` was added to `requirements.txt`.
3. **Deploy stage**: now runs `deploy.sh`, which copies `app.py` to a local
   directory (`$HOME/deployed_app` by default, override with `DEPLOY_DIR`) and
   runs it to verify the deployment.

## Pipeline stages

Setup -> Lint -> Test -> Coverage -> Security Scan -> Deploy

## Pipeline output

<!-- Paste the Jenkins console output / screenshot of the successful build here -->
