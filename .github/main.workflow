workflow "CI" {
  on = "pull_request"
  resolves = ["notify-workflow"]
}

action "install" {
  uses = "ivanklee86/python_pipenv_action@master"
  runs = ["pipenv", "install", "--dev"]
}

action "tests" {
  needs = "install"
  uses = "ivanklee86/python_pipenv_action@master"
  runs = ["pipenv", "run", "testci"]
  env = {
    SLACK_CHANNEL = "C5BMKV7EV"
  }
  secrets = ["SLACK_TOKEN"]
}

action "notify-tests" {
  needs = "tests"
  uses = "./"
  env = {
    SLACK_CHANNEL = "CKQ7C7KJN"
    XUNIT_PATH = "./results.xml"
    EXIT_CODE_FROM_REPORT = "True"
  },
  secrets = ["SLACK_TOKEN"]
}


action "pylint" {
  needs = "install"
  uses = "ivanklee86/python_pipenv_action@master"
  runs = ["pipenv", "run", "pylint", "app"]
}

action "mypy" {
  needs = "install"
  uses = "ivanklee86/python_pipenv_action@master"
  runs = ["pipenv", "run", "mypy", "app"]
}

action "notify-workflow" {
  needs = [
    "notify-tests",
    "mypy",
    "pylint",
  ]
  uses = "rtCamp/action-slack-notify@master"
  env = {
    SLACK_USERNAME = "Github"
    SLACK_ICON = "https://slack-files2.s3-us-west-2.amazonaws.com/avatars/2017-12-19/288981919427_f45f04edd92902a96859_512.png"
    SLACK_COLOR = "#3278BD"
    SLACK_TITLE = "CI pipeline completed"
    SLACK_MESSAGE = ":rocket:"
  }
  secrets = ["SLACK_WEBHOOK"]
}
