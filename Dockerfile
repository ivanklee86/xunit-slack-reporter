
# ====================================================================== #
# xUnit Slack Reporter Docker Image
# ====================================================================== #

# Base image
# ---------------------------------------------------------------------- #
FROM python:3.7.3
LABEL MAINTAINER="Ivan Lee"

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


# Start service
# ---------------------------------------------------------------------- #
CMD ["run.sh"]
