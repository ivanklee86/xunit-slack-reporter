
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
LABEL "repository"="https://github.com/jefftriplett/python-actions"
LABEL "homepage"="https://github.com/jefftriplett/python-actions"
LABEL "maintainer"="Jeff Triplett <jeff.triplett@github.com>"

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
