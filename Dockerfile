FROM            ghcr.io/4lambda/centos:8 AS base

RUN             yum install -y \
                    gcc-8.5.0-13.el8 \
                    git-2.31.1-2.el8 \
                    python38-3.8.13-1.module_el8.7.0+1177+19c53253 \
                    python38-devel-3.8.13-1.module_el8.7.0+1177+19c53253 \
                && yum clean -q all && \
                ln -snf pip3 /usr/bin/pip

FROM base as py-base

RUN             python3 -m pip --no-cache-dir install -U pip==22.1.2 && \
                python3 -m pip --no-cache-dir install -U \
                    build==0.8.0 \
                    setuptools==63.1.0 \
                    virtualenv==20.15.1 \
                    wheel==0.37.1 
