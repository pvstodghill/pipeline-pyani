#! /bin/bash

set -e

CONDA_PREFIX=$(dirname $(dirname $(type -p conda)))
. "${CONDA_PREFIX}/etc/profile.d/conda.sh"

PACKAGES+=" fastani"
PACKAGES+=" pyani"

set -x

conda env remove -y --name pipeline-pyani
conda create -y --name pipeline-pyani
conda activate pipeline-pyani

conda install -y ${PACKAGES}
