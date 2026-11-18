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

Build #3 of the `Python-CI-CD` job finished with **SUCCESS** (full log: `screenshots/console_output.txt`).

- Lint (flake8): no warnings. Test (pytest): 1 passed.
- Coverage: `app.py` 4 statements, 1 missed, 75% (the missed line is the `__main__` print).
- Security Scan (bandit): No issues identified (0 low/medium/high).
- Deploy: `deploy.sh` copied `app.py` to `~/deployed_app` and printed `Hello, World from Leen Abdallah!`, then `Deployment successful.`

Screenshots (in `screenshots/`): `01_job_status.png`, `02_pipeline_steps.png`, `04_test_coverage.png`, `05_coverage_report.png`, `06_security_scan.png`, `07_deploy_success.png`.
