workflow "CI" {
  on = "pull_request"
  resolves = ["tests", "pylint", "mypy"]
}

action "install" {
  uses = "./build_action"
  runs = ["pipenv", "install", "--dev"]

}

action "tests" {
  needs = "install"
  uses = "./build_action"
  runs = ["pipenv", "run", "test"]
}

action "pylint" {
  needs = "install"
  uses = "./build_action"
  runs = ["pipenv", "run", "pylint", "app"]
}

action "mypy" {
  needs = "install"
  uses = "./build_action"
  runs = ["pipenv", "run", "mypy", "app"]
}
