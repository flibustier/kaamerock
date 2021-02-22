# Kaamelott Voice Pack for your Roborock vacuum cleaner

![](https://media.giphy.com/media/17Z9AMUpJsV5m/giphy.gif)

You have a Xiaomi Mijia Vacuum or Roborock Vacuum and you’re tired of the boring "Starting to clean" ? Let’s add some french Kaamelott instead !

This pack is working with Roborock v1 (Xiaomi Mijia v1), s5, s50… and more

> Tested with Xiaomi Mijia v1 (a.k.a. Roborock v1), audio files are same for Roborock S5, for other models please verify the list of audio file names (consult the `audio_mapping.csv` in this project for audio files used here)

## Remerciements 🙌

This pack contains a lots of Kaamelott audio taken from the fantastic [kaamelott soundboard](https://github.com/2ec0b4/kaamelott-soundboard)

The packaging script is made possible by [Dust cloud](https://github.com/dgiese/dustcloud)

## Install 🚀

![](https://media.giphy.com/media/iIqdo2k1kVaXpSWm93/giphy.gif)

### Requirements

You will need :
- Your Xiaomi device token, there is a lot of methods, personnaly I used [this electron app](https://github.com/Maxmudjon/com.xiaomi-miio/blob/master/docs/obtain_token.md)
- The device IP address (like `192.168.1.25`)
- A way to send the voice package to the vacuum, I used [python-miio](https://github.com/rytilahti/python-miio) for doing so 

Installation of `python-miio` could be found [here](https://python-miio.readthedocs.io/en/latest/discovery.html#installation).
i.e. `brew install libffi openssl` or `apt install libffi-dev libssl-dev`; 
Then `pip3 install python-miio`

When `python-miio` is installed, you can simply run :

`mirobo --ip=192.168.1.25 --token=42**************************1337 install-sound ./fr_patched.pkg`

> don’t forget to change for your IP address and token

The Kaamelott voice pack come from the [latest release](https://github.com/flibustier/kaamerock)

## Build/Customize it yourself

![](https://media.giphy.com/media/qQdfSrX85gQcU/giphy-downsized.gif)

### Requirements

- `ccrypt` must be installed
e.g. `sudo apt install ccrypt` or `brew install ccrypt`
- `tar` must be installed too
- `ffmpeg` must be installed to transcode `mp3` file into `wav` 16 bits Mono track 16kHz

### Base voice pack

You need a base voice pack for falling back the missings sentences (like error messages). You could find a variety of language pack for all kind of vacuum [in the dustcloud](http://dustbuilder.xvm.mit.edu/pkg)

For this project, I’ve took the `fr` package for Roborock s5, as it will works for previous version too (Xiaomi Mijia v1, …) :

`wget http://dustbuilder.xvm.mit.edu/pkg/voice-s5/fr.pkg`

### Unpack

You will now need to unpack the base voice package :

`./unpackage.sh fr.pkg dist`

> Replace `fr.pkg` with the name of the base voice pack you downloaded previously

Now you should have a `dist` folder with a lot of `.wav` audio files

### Build or Customize

You can modify the `audio_mapping.csv` file to adjust the sentence you want to hear.

First column is the `kaamelott soundboard` audio file name. It’s here you can change a sentence with an other one. To get the filename, I recommand you to go to the [live soundboard](https://kaamelott-soundboard.2ec0b4.fr/), chose an audio and copy the name after the `/#son/` in the URL.

Second column is the name of the `wav` used by the vacuum for the specific action, you should not change this unless you’re trying to adjust the mapping for an other vacuum model (in this case I encourage you 👏, don’t forget to share your work 😉).

Third column is an english sentence corresponding to an [english audio pack](https://github.com/fredless/RoborockVoicePacks/blob/master/Phil/audio_en.csv), it’s just for conveniance to know exactly what was the meaning of the original audio file. You have no interest in modifying this column unless you know what your doing!

🧙‍♂️ When you’re ready you can execute the 
`./moulinette.sh`

It will read the `audio_mapping.csv` file, take `.mp3` audio file from `kaamelott soundboard` and transcode it into a `mono 16 bits WAV 16kHz` with the corresponding file name.

> /!\ if you want to use audio file from elsewhere, make sure to transcode it into a Mono track WAV 16 bits at 16kHz, for that you can take inspiration from the `ffmpeg` command in the `moulinette.sh`

### Pack

Now your dist folder is ready to be pack 📦
`./package.sh dist fr_kaamelott`

> Replace 'fr_kaamelott' with the name you want to give to your custom voice package, but don’t add .pkg at the end of your package name, it will be added automatically

🎉 Now you’re ready to install it 👏

![](https://media.giphy.com/media/149eCxEQPfhwyY/giphy.gif)
