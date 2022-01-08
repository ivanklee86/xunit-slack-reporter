SHELL := /bin/bash
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PROJECT_NAME = xunitslackreporter

#-----------------------------------------------------------------------
# Rules of Rules : Grouped rules that _doathing_
#-----------------------------------------------------------------------
test: lint pytest

build: build-dockerimage

#-----------------------------------------------------------------------
# Testing & Linting
#-----------------------------------------------------------------------

lint:
	export PYTHONPATH=${ROOT_DIR}:$$PYTHONPATH;
	mypy --install-types --non-interactive app;
	pylint app;

pytest:
	export PYTHONPATH=${ROOT_DIR}:$$PYTHONPATH && \
	py.test tests

#-----------------------------------------------------------------------
# Run Rules
#-----------------------------------------------------------------------
run:
	run.sh

# Run in Docker
run-docker:
	docker run -it --rm --name ${PROJECT_NAME} \
	${PROJECT_NAME}:latest

#-----------------------------------------------------------------------
# Docker Rules
#-----------------------------------------------------------------------
# Build Docker image
build-docker:
	docker build -t ${PROJECT_NAME} .

# Deletes Docker image
clean-docker:
	docker rm ${PROJECT_NAME}