#!/bin/bash

copyI3config () {
  configPath=/etc/X11/xorg.conf.d/
  cp -s --backup=existing --suffix=.orig -t ${configPath} `pwd`${configPath}90-touchpad.conf 
  mkdir -p ./originals && mv --backup=numbered ${configPath}*.orig ./originals
}






copyI3config
