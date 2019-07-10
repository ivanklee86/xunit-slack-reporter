workflow "CI" {
  on = "pull_request"
  resolves = "test"
}

action "pipenv-sync" {
  uses = "peaceiris/actions-pipenv@3.7"
  args = ["sync"]
}

action "test" {
  needs = "pipenv-sync"
  uses = "peaceiris/actions-pipenv@3.7"
  args = ["run", "test"]
}