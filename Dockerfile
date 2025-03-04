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
    clang lld ccache \
    cmake ninja-build \
  && rm -rf /var/lib/apt/lists/*
RUN apt-get install

RUN echo "export PATH=$PATH:/home/polyarch/mlir-df/" >> /etc/bash.bashrc

RUN useradd -ms /bin/bash polyarch
USER polyarch

WORKDIR /home/polyarch
ENTRYPOINT ["/bin/bash"]
