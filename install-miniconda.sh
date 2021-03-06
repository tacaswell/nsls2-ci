#!/bin/sh
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p ~/miniconda
# export conda into script environment
export PATH=~/miniconda/bin:$PATH
export CONDA_BUILD_COMMAND="conda-build conda-recipe --python=$TRAVIS_PYTHON_VERSION"
# make a condarc for easier conda operation on travis
echo "
always_yes: true
show_channel_urls: True
track_features:
- nomkl
channels:
- lightsource2-dev
- lightsource2
- scikit-xray
- conda-forge
- defaults
" > ~/.condarc
# update conda to the latest version
conda update conda
