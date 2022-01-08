
# ====================================================================== #
# xUnit Slack Reporter Docker Image
# ====================================================================== #

# Base image
# ---------------------------------------------------------------------- #
FROM python:3.10.1
LABEL MAINTAINER="Ivan Lee"

LABEL "com.github.actions.name"="xUnit Slack Reporter"
LABEL "com.github.actions.description"="Reports results of tests in xUnit to Slack channel."
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="https://github.com/ivanklee86/xunit-slack-reporter"
LABEL "homepage"="https://github.com/ivanklee86/xunit-slack-reporter"
LABEL "maintainer"="Ivan Lee <ivanklee@gmail.com>"

# Make working directory
# ---------------------------------------------------------------------- #
RUN mkdir /source
WORKDIR /source

# Install dependencies
# ---------------------------------------------------------------------- #
COPY poetry.lock /source
COPY pyproject.toml /source
RUN pip install -U pip poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev 

# Copy files into image
# ---------------------------------------------------------------------- #
COPY . /source

# Container settings
# ---------------------------------------------------------------------- #

# Image settings
ENV LC_ALL C.UTF-8
ENV LANG =C.UTF-8

# Python variables
ENV PYTHONPATH /source

# Run action
# ---------------------------------------------------------------------- #
ENTRYPOINT ["/source/entrypoint.sh"]
