FROM ubuntu:22.04

RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker

RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y \
    git vim wget curl sudo \
    python3 \
    ca-certificates \
    build-essential \
    clang lld \
    cmake ninja-build \
  && rm -rf /var/lib/apt/lists/*
RUN apt-get install

RUN echo "export PATH=$PATH:/home/polyarch/" >> /etc/bash.bashrc

RUN useradd -ms /bin/bash polyarch
USER polyarch

RUN cd /home/polyarch \
  && wget https://github.com/bazelbuild/bazelisk/releases/download/v1.25.0/bazelisk-linux-amd64 -O bazel \
  && chmod +x bazel \
  && ./bazel

WORKDIR /home/polyarch
ENTRYPOINT ["/bin/bash"]
