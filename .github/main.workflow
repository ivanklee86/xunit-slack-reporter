workflow "CI" {
  on = "pull_request"
  resolves = ["test", "test2"]
}

action "pipenv-sync" {
  uses = "peaceiris/actions-pipenv@3.7"
  args = ["sync"]
}

action "test" {
  needs = "pipenv-sync"
  uses = "peaceiris/actions-pipenv@3.7"
  args = ["run", "pytest"]
}

action "test2" {
  needs = "pipenv-sync"
  uses = "peaceiris/actions-pipenv@3.7"
  args = ["run", "test"]
}

action "test3" {
  needs = "pipenv-sync"
  uses = "peaceiris/actions-pipenv@3.7"
  args = ["run", "pythob", "-m","pytest"]
}
