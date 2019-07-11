
# ====================================================================== #
# xUnit Slack Reporter Docker Image
# ====================================================================== #

# Base image
# ---------------------------------------------------------------------- #
FROM python:3.7.3
LABEL MAINTAINER="Ivan Lee"

# Labels
# ---------------------------------------------------------------------- #
LABEL "version"="1.0.0"
LABEL "repository"="http://github.com/ivanklee86/xunit-slack-reporter"
LABEL "homepage"="http://github.com/ivanklee86/xunit-slack-reporter"
LABEL "maintainer"="Ivan Lee <ivanklee86@gmail.com>"

LABEL "com.github.actions.name"="Intermediate build."
LABEL "com.github.actions.description"="Wraps Python/Pipenv for Github Actions."
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"


# Container setup
# ---------------------------------------------------------------------- #
COPY entrypoint.sh /

# Image settings
ENV LC_ALL C.UTF-8
ENV LANG =C.UTF-8
ENV PIPENV_VENV_IN_PROJECT true

# Python
RUN pip install pipenv

# Start service
# ---------------------------------------------------------------------- #
ENTRYPOINT [ "/entrypoint.sh" ]
