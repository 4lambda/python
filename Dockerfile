FROM            ghcr.io/4lambda/centos:8 AS base

RUN             yum install -y \
                    git \
                    gcc \
                    python38 \
                    python38-pip \
                    python38-devel \
                && yum clean -q all
RUN             ln -snf pip3 /usr/bin/pip

FROM base as py-base

RUN             python3 -m pip --no-cache-dir install -U pip==22.1.2 && \
                python3 -m pip --no-cache-dir install -U \
                    setuptools==63.1.0 \
                    virtualenv==20.15.1 \
                    wheel==0.37.1 
