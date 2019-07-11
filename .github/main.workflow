workflow "CI" {
  on = "pull_request"
  resolves = "Run tests"
}

action "Install dependencies" {
  uses = "./build_env"
  runs = ["pipenv", "install", "--dev"]

}

action "Run tests" {
  needs = "Install dependencies"
  uses = "./build_env"
  runs = ["pipenv", "run", "test"]
}
