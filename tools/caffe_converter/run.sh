#!/bin/bash
if [[ $# -ne 1 ]]; then
    echo "usage: $0 model_name"
    echo "   model_name: vgg-19, ..."
    exit -1
fi

if [[ $1 == "vgg-m" ]]; then
    if [[ ! -f VGG_CNN_M_deploy.prototxt ]]; then
        wget -c https://gist.githubusercontent.com/ksimonyan/f194575702fae63b2829/raw/6516d9be2064680697ee6791d8de77cfc0dd0990/VGG_CNN_M_deploy.prototxt
    fi

    if [[ ! -f VGG_CNN_M.caffemodel ]]; then
        wget -c http://www.robots.ox.ac.uk/~vgg/software/deep_eval/releases/bvlc/VGG_CNN_M.caffemodel
    fi

    echo "converting"
    python `dirname $0`/convert_model.py VGG_CNN_M_deploy.prototxt VGG_CNN_M.caffemodel vgg-m
elif [[ $1 == "vgg-16" ]]; then
    if [[ ! -f VGG_ILSVRC_16_layers_deploy.prototxt ]]; then
        wget -c https://gist.githubusercontent.com/ksimonyan/211839e770f7b538e2d8/raw/c3ba00e272d9f48594acef1f67e5fd12aff7a806/VGG_ILSVRC_16_layers_deploy.prototxt
    fi

    if [[ ! -f VGG_ILSVRC_16_layers.caffemodel ]]; then
        wget -c http://www.robots.ox.ac.uk/~vgg/software/very_deep/caffe/VGG_ILSVRC_16_layers.caffemodel
    fi

    echo "converting"
    python `dirname $0`/convert_model.py VGG_ILSVRC_16_layers_deploy.prototxt VGG_ILSVRC_16_layers.caffemodel vgg-16
elif [[ $1 == "vgg-19" ]]; then
    if [[ ! -f VGG_ILSVRC_19_layers_deploy.prototxt ]]; then
        wget -c https://gist.githubusercontent.com/ksimonyan/3785162f95cd2d5fee77/raw/bb2b4fe0a9bb0669211cf3d0bc949dfdda173e9e/VGG_ILSVRC_19_layers_deploy.prototxt
    fi

    if [[ ! -f VGG_ILSVRC_19_layers.caffemodel ]]; then
        wget -c http://www.robots.ox.ac.uk/~vgg/software/very_deep/caffe/VGG_ILSVRC_19_layers.caffemodel
    fi

    echo "converting"
    python `dirname $0`/convert_model.py VGG_ILSVRC_19_layers_deploy.prototxt VGG_ILSVRC_19_layers.caffemodel vgg-19
else
    echo "unsupported model: $1"
fi
