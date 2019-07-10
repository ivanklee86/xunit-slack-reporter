workflow "CI" {
  on = "pull_request"
  resolves = "Run tests"
}

action "Install pipenv" {
  uses = "docker://python:3.7.2"
  runs = ["pip", "install", "pipenv"]
}

action "Run tests" {
  needs = "Install pipenv"
  uses = "docker://python:3.7.2"
  runs = ["pipenv", "-v"]
}
