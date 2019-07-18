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

#copy i3 layout
copyI3layouts () {
  configPath=/home/$SUDO_USER/.i3/
  ln -s `pwd`/home/user/i3/layouts ${configPath}layouts 
}

#copy tmux config
copyTmuxconfig () {
  configPath=/home/$SUDO_USER/
  cp -s --backup=existing --suffix=.orig -t ${configPath} `pwd`/home/user/.tmux.conf 
  mkdir -p ./originals && mv --backup=numbered ${configPath}*.orig ./originals
}

#copy vim config
copyVimconfig () {
  configPath=/home/$SUDO_USER/
  cp -s --backup=existing --suffix=.orig -t ${configPath} `pwd`/home/user/.vimrc 
  mkdir -p ./originals && mv --backup=numbered ${configPath}*.orig ./originals
}

copyX11config
copyI3config
copyI3layouts
copyTmuxconfig
copyVimconfig
