#!/bin/bash

SOURCE_FILE=$1
OUTPUT_DIRECTORY=$2

SOUND_PASSWORD="r0ckrobo#23456"

ccrypt --decrypt --key $SOUND_PASSWORD $SOURCE_FILE
mkdir -p $OUTPUT_DIRECTORY
tar -xzf $SOURCE_FILE -C $OUTPUT_DIRECTORY
