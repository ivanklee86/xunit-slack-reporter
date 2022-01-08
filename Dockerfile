
# ====================================================================== #
# xUnit Slack Reporter Docker Image
# ====================================================================== #

# Base image
# ---------------------------------------------------------------------- #
FROM python:3.10.1
LABEL MAINTAINER="Ivan Lee"

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
