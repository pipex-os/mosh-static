# Based on from https://github.com/javabrett/mosh/blob/docker/dockerfiles/Dockerfile.alpine
FROM alpine

ARG MOSH_VERSION=1.3.2

RUN apk update && \
  apk --no-cache add \
  git \
  autoconf \
  automake \
  build-base \
  ncurses-dev \
  ncurses-static \
  openssh-client \
  openssh-server \
  openssl-dev \
  openssl-libs-static \
  perl-doc \
  protobuf-dev \
  zlib-static \
  zlib-dev \
  libutempter-dev

# Build as static file
RUN git clone --depth=1 --branch mosh-${MOSH_VERSION} https://github.com/mobile-shell/mosh.git  && \
    cd mosh && \
    ./autogen.sh && LDFLAGS=-static ./configure && make


FROM scratch

COPY --from=0 /mosh/src/frontend/mosh-server /
COPY --from=0 /mosh/src/frontend/mosh-client /
