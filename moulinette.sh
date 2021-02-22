#!/bin/bash

DESTINATION=dist
SOURCE_DIRECTORY=kaamelott-soundboard/sounds

while IFS=, read -r soundName outputFile description
do
    if [ -n "$soundName" ]
    then
        echo "$soundName -> $outputFile ($description)"
        ffmpeg -nostdin -hide_banner -loglevel error -i "$SOURCE_DIRECTORY/$soundName.mp3" -acodec pcm_s16le -ac 1 -ar 16000 -y "$DESTINATION/$outputFile"
    fi
done < audio_mapping.csv