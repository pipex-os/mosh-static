# Based on from https://github.com/javabrett/mosh/blob/docker/dockerfiles/Dockerfile.alpine
FROM alpine

ARG MOSH_VERSION=1.4.0
ENV MOSH=mosh-${MOSH_VERSION}

RUN apk update && \
  apk --no-cache add \
  curl \
  perl \
  gzip \
  clang \
  make \
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
  abseil-cpp-dev \
  libutempter-dev

# Build as static file
ENV CPPFLAGS=-std=c++17
ENV LDFLAGS=-static
RUN curl -sLO https://github.com/mobile-shell/mosh/releases/download/mosh-${MOSH_VERSION}/${MOSH}.tar.gz && \
    tar xvfz ${MOSH}.tar.gz && \
    cd ${MOSH} && \
    ./configure && make

#
# FROM scratch
#
# COPY --from=0 /mosh/src/frontend/mosh-server /
# COPY --from=0 /mosh/src/frontend/mosh-client /
