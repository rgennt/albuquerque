#!/bin/bash

#copy x11 touchpad ocnfig
copyX11config (){
  configPath=/etc/X11/xorg.conf.d/
  cp -s --backup=existing --suffix=.orig -t ${configPath} `pwd`${configPath}90-touchpad.conf 
  mkdir -p ./originals && mv --backup=numbered ${configPath}*.orig ./originals
}

#copy i3 config
copyI3config () {
  configPath=/home/$SUDO_USER/.config/i3/
  cp -s --backup=existing --suffix=.orig -t ${configPath} `pwd`/home/user/config/i3/config 
  mkdir -p ./originals && mv --backup=numbered ${configPath}*.orig ./originals
}

copyX11config
copyI3config
