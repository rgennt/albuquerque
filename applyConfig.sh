#!/bin/bash

# Copy any originals to original folder
copyOriginalsFrom (){
  count=`ls -1 ${1}*.orig 2>/dev/null | wc -l`
  if [ $count != 0 ]
  then 
    # Create folder to store originals
    mkdir -p ~/originals/
    mv --backup=numbered ${1}*.orig ~/originals/$(hostname)/
  fi

}

# copy x11 touchpad ocnfig
copyX11Touchpadconfig (){
  configPath=/etc/X11/xorg.conf.d/
  #Make sure config folder exist
  mkdir -p ${configPath}
  cp -s --backup=existing --suffix=.orig -t ${configPath} `pwd`${configPath}90-touchpad.conf 
  if [ $? -eq 0 ]
  then
    copyOriginalsFrom ${configPath}
    echo "X11 touchad config placed"
  else
    echo "FAILED: X11 touchpad"
  fi
}

# copy x11 brightness ocnfig. UX31A had no brightness control
copyX11Brightnesconfig (){
  configPath=/etc/X11/xorg.conf.d/
  #Make sure config folder exist
  mkdir -p ${configPath}
  cp -s --backup=existing --suffix=.orig -t ${configPath} `pwd`${configPath}80-backlight.conf 
  if [ $? -eq 0 ]
  then
    copyOriginalsFrom ${configPath}
    echo "X11 touchad config placed"
  else
    echo "FAILED: X11 Backlight"
  fi
}

#copy i3 config
copyI3config () {
  configPath=/home/$SUDO_USER/.config/i3/
  cp -s --backup=existing --suffix=.orig -t ${configPath} `pwd`/home/user/config/i3/config 
  if [ $? -eq 0 ]
  then
    copyOriginalsFrom ${configPath}
    echo "i3 config placed"
  else
    echo "FAILED: i3 config"
  fi
}

#copy i3 layout
copyI3layouts () {
  configPath=/home/$SUDO_USER/.i3/
  mkdir -p ${configPath}
  ln -s `pwd`/home/user/i3/layouts ${configPath}layouts 
  if [ $? -eq 0 ]
  then
    echo "i3 layout placed"
  else
    echo "FAILED: i3 layout"
  fi
}

#copy tmux config
copyTmuxconfig () {
  configPath=/home/$SUDO_USER/
  mkdir -p ${configPath}
  cp -s --backup=existing --suffix=.orig -t ${configPath} `pwd`/home/user/.tmux.conf 
  if [ $? -eq 0 ]
  then
    copyOriginalsFrom ${configPath}
    echo "Tmux config placed"
  else
    echo "FAILED: tmux"
  fi
}

#copy vim config
copyVimconfig () {
  configPath=/home/$SUDO_USER/
  cp -s --backup=existing --suffix=.orig -t ${configPath} `pwd`/home/user/.vimrc 
  if [ $? -eq 0 ]
  then
    copyOriginalsFrom ${configPath}
    echo "Tmux config placed"
  else
    echo "FAILED: tmux"
  fi
}

copyX11config
copyX11Touchpadconfig
copyX11Brightnesconfig
copyI3config
copyI3layouts
copyTmuxconfig
copyVimconfig
