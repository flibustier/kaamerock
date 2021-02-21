#!/bin/bash

while IFS=, read -r soundName outputFile description
do
    if [ -n "$soundName" ]
    then
        echo "$soundName -> $outputFile ($description)"
        ffmpeg -nostdin -hide_banner -loglevel error -i "kaamelott-soundboard/sounds/$soundName.mp3" -acodec pcm_s16le -ac 1 -ar 16000 -y "./dist/$outputFile"
    fi
done < audio_mapping.csv