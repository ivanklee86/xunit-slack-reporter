workflow "CI" {
  on = "pull_request"
  resolves = "Run tests"
}

action "Install pipenv" {
  uses = "docker://python:3.7.2"
  runs = ["pip", "install", "pipenv"]
}

action "Install dependencies" {
  needs = "Install pipenv"
  uses = "docker://python:3.7.2"
  runs = ["pipenv", "install", "--system", "--deploy"]
}

action "Run tests" {
  needs = "Install dependencies"
  uses = "docker://python:3.7.2"
  runs = ["python", "-m", "pytest"]
}
