#!/bin/bash
# pwd
conda --version

conda create --solver=libmamba -p $1/rapids-env -c rapidsai -c conda-forge -c nvidia  \
    rapids python=3.9 cuda-version=12.4 -y

conda activate $1/rapids-env
which python
pip uninstall cupy numba -y # I reinstall default rapids cupy and numba via pypi due to the problems of my environment
# It is not actually needed in general case
pip install tqdm cupy-cuda12x numba py-boost
