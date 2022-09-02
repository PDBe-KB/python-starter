# Python Starter

Starter repo for Python Projects. Should be used to get common linting and formatting started.


## Run tests
Run tests with pytest and create coverage report.
```
make test
```

## pre-commit usage
```
pip install pre-commit && pre-commit install
pre-commit run --all
```

### Workflow automation using GitHub Actions
This repo uses GitHub Actions to automate the workflow. The workflow is defined in the `.github/workflows` directory. The workflow is triggered on every push to the repository. The workflow runs the following steps:

1. Build
   This job installs necessary dependencies and runs the tests. If the tests fail, the workflow is stopped. If the tests pass, the job proceeds to the next step which creates the wheel file. This will later be used to upload the artifacts. It also uploads the coverage report to Codecov.
   Creating the wheel and uploading the coverage report is only done for **main** branch. For other branches, only the tests are run.
2. Deploy
   Download the artifacts from the previous job and use twine to upload the package to internal PDBe PyPI.

**NOTE**: Change the environment variables in the `env` section of the workflow file to match your project.
