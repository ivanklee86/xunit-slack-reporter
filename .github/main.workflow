workflow "CI" {
  on = "pull_request"
  resolves = "Run tests"
}

action "Install dependencies" {
  uses = "./Dockerfile-build.local"
  runs = ["pipenv", "install"]

}

action "Run tests" {
  needs = "Install dependencies"
  uses = "./Dockerfile-build.local"
  runs = ["pipenv", "run", "test"]
}
