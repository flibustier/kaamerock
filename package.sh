#!/bin/bash

SOURCE_DIRECTORY=$1
OUTPUT_PACKAGE_NAME=$2

SOUND_PASSWORD="r0ckrobo#23456"
CURRENT_DIRECTORY=$(pwd)

cd $SOURCE_DIRECTORY
tar -czf $OUTPUT_PACKAGE_NAME *.wav
ccrypt --encrypt --suffix .pkg --key $SOUND_PASSWORD $OUTPUT_PACKAGE_NAME
mv $OUTPUT_PACKAGE_NAME.pkg $CURRENT_DIRECTORY/
ls $CURRENT_DIRECTORY/$OUTPUT_PACKAGE_NAME.pkg