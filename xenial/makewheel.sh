#!/bin/sh

set -x

git clone -b stable/$BRANCH https://github.com/openstack/requirements.git /app/

~/.pyenv/versions/venv/bin/pip wheel --wheel-dir=/.wheelhouse -c /app/upper-constraints.txt -r /app/global-requirements.txt -f /.wheelhouse/
