FROM python:2.7-slim-stretch

ENV PYENV_ROOT /opt/pyenv
ENV PATH "$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"

ENV MAYUR_DOCKER_PYENV_HOME /mayur/docker-pyenv

RUN apt-get update && \
apt-get install -y curl gcc git g++ libbz2-dev libsqlite3-dev libssl1.0-dev libreadline-dev make zlib1g-dev bzip2

RUN mkdir -p "$PYENV_ROOT" && \
    git clone https://github.com/pyenv/pyenv.git "$PYENV_ROOT" && \
    cd "$PYENV_ROOT" && \
    rm -r "$PYENV_ROOT/.git"

RUN set -x \
    && PYTHON2_VERSION="2.7.15" \
    && PYTHON3_VERSION="3.6.6" \
    && ANACONDA2_VERSION="anaconda2-5.3.0" \
    && ANACONDA3_VERSION="anaconda3-5.3.0" \
    && pyenv install "$PYTHON2_VERSION" \
    && pyenv install "$PYTHON3_VERSION" \
    && pyenv install "$ANACONDA2_VERSION" \
    && pyenv install "$ANACONDA3_VERSION" \
&& pyenv global system "$PYTHON2_VERSION" 

