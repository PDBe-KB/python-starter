.PHONY: test

default: test

test:
	pre-commit install && pre-commit run --all
	coverage run -m pytest --junitxml=report.xml
	coverage xml -o coverage/cobertura-coverage.xml
	coverage report -m
