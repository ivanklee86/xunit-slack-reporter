
# ====================================================================== #
# xUnit Slack Reporter Docker Image
# ====================================================================== #

# Base image
# ---------------------------------------------------------------------- #
FROM python:3.7.3
LABEL MAINTAINER="Ivan Lee"

LABEL "com.github.actions.name"="xUnit Slack Reporter"
LABEL "com.github.actions.description"="Reports results of tests in xUnit to Slack channel."
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="https://github.com/ivanklee86/xunit-slack-reporter"
LABEL "homepage"="https://github.com/ivanklee86/xunit-slack-reporter"
LABEL "maintainer"="Ivan Lee <ivanklee@gmail.com>"

# Copy files into image
# ---------------------------------------------------------------------- #
COPY . /app
WORKDIR /app

# Install app
# ---------------------------------------------------------------------- #
RUN pip install pipenv
RUN pipenv install --system --deploy

# Container settings
# ---------------------------------------------------------------------- #

# Image settings
ENV LC_ALL C.UTF-8
ENV LANG =C.UTF-8

# Python variables
ENV PYTHONPATH /app


# Run action
# ---------------------------------------------------------------------- #
ENTRYPOINT ["entrypoint.sh"]
