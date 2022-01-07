# mosh-static

An unofficial static binary distribution of [mobile-shell/mosh](https://github.com/mobile-shell/mosh) which can be dropped into a remote server. This is a fork of [mosh-static](
) with the aim of publishing images in multiple architectures. Static binaries should be available under [releases](https://github.com/pipex/mosh-build/releases) and docker images with
those binaries made public on [Docker Hub](https://hub.docker.com/u/pipex/mosh).

Releasing is automated by GitHub Actions.

## Using the binaries

```sh
# On the server
wget https://github.com/dtinth/mosh-static/releases/latest/download/mosh-server
chmod +x mosh-server

# On the client
mosh --server=./mosh-server <username>@<hostname>
```

