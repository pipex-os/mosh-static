// docker-bake.hcl
// https://github.com/docker/metadata-action#bake-definition
target "docker-metadata-action" {}

target "build" {
  inherits = ["docker-metadata-action"]
  context = "./"
  dockerfile = "Dockerfile"
  args = {
    MOSH_VERSION = "1.3.2"
  }
  platforms = [
    "linux/amd64",
    "linux/386",
    "linux/arm/v6",
    "linux/arm/v7",
    "linux/arm64",
  ]
}
