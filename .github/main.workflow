workflow "CI" {
  on = "pull_request"
  resolves = "Run tests"
}

action "Install dependencies" {
  uses = "./build_action"
  runs = ["pipenv", "install", "--dev"]

}

action "Run tests" {
  needs = "Install dependencies"
  uses = "./build_action"
  runs = ["pipenv", "run", "test"]
}

action "Run pylint" {
  needs = "Install dependencies"
  uses = "./build_action"
  runs = ["pipenv", "run", "pylint", "app"]
}

action "Run typechecker" {
  needs = "Install dependencies"
  uses = "./build_action"
  runs = ["pipenv", "run", "mypy", "app"]
}
