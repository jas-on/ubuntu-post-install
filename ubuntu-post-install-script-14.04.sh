#!/bin/bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-

echo ''
echo '#-------------------------------------------#'
echo '#     Ubuntu 14.04 Post-Install Script      #'
echo '#-------------------------------------------#'

#----- FUNCTIONS -----#

# SYSTEM UPGRADE
function sysupgrade {
# Perform system upgrade
echo ''
read -p 'Proceed with system upgrade? (Y)es, (N)o : ' REPLY
case $REPLY in
# Positive action
[Yy]* )
    # Update repository information
    echo 'Updating repository information...'
    echo 'Requires root privileges:'
    sudo apt-get update
    # Dist-Upgrade
    echo 'Performing system upgrade...'
    sudo apt-get dist-upgrade -y
    echo 'Done.'
    main
    ;;
# Negative action
[Nn]* )
    clear && main
    ;;
# Error
* )
    clear && echo 'Sorry, try again.'
    sysupgrade
    ;;
esac
}

# INSTALL APPLICATIONS
function favorites {
echo ''
echo 'Installing selected applications...'
echo ''
echo 'Current package list:
audacity
canto
cheese
darktable
easytag
evince
feh
ffmpeg
filezilla
gnome-do
gnome-tweak-tool
gpick
grsync
irssi
libreoffice
lynx
mutt
nautilus-dropbox
nautilus-open-terminal
ncmpcpp
pianobar
pidgin
pyrenamer
redshift
shotwell
skype
sparkleshare
texmaker
tightvncserver
truecrypt
xchat
vlc
weechat
wireshark'
echo ''
read -p 'Proceed? (Y)es, (N)o : ' REPLY
case $REPLY in
# Positive action
[Yy]* ) 
    echo 'Requires root privileges:'
    # Feel free to change to whatever suits your preferences.
    sudo apt-get install -y --no-install-recommends cheese darktable easytag gnome-tweak-tool gpick grsync nautilus-dropbox nautilus-open-terminal pyrenamer sparkleshare xchat vlc ncmpcpp mutt canto redshift weechat irssi pianobar filezilla feh shotwell libreoffice lynx wireshark evince pidgin mumble audacity texmaker gnome-do tightvncserver

    #TrueCrypt
    sudo add-apt-repository ppa:michael-astrapi/ppa
    sudo apt-get update && sudo apt-get install truecrypt

    #ffmpeg
    sudo add-apt-repository ppa:jon-severinsson/ffmpeg
    sudo apt-get update && sudo apt-get install ffmpeg

    #Skype
    echo "deb http://archive.canonical.com/ubuntu trusty partner\ndeb-src http://archive.canonical.com/ubuntu trusty partner\n" | sudo tee -a /etc/apt/sources.list && sudo apt-get update
    sudo apt-get install libqt4-dbus:i386 libqt4-network:i386 libqt4-xml:i386 libqtcore4:i386 libqtgui4:i386 libqtwebkit4:i386 sni-qt:i386
    sudo apt-get install skype

    echo 'Done.'
    main
    ;;
# Negative action
[Nn]* )
    clear && main
    ;;
# Error
* )
    clear && echo 'Sorry, try again.'
    favorites
    ;;
esac
}

# INSTALL SYSTEM TOOLS
function system {
echo ''
echo '1. Install favorite system utilities?'
echo '2. Install fingerprint reader software?'
echo 'r. Return.'
echo ''
read -p 'What would you like to do? (Enter your choice) : ' REPLY
case $REPLY in
# Install Favorite System utilities
1)
    echo 'Installing favorite system utilities...'
    echo ''
    echo 'Current package list:
    aptitude
    awk
    curl
    dconf-tools
    dos2unix
    fail2ban
    feh
    fontconfig
    gnupg
    gparted
    htop
    lftp
    mpd
    mtr
    nmap
    openjdk-7-jdk
    openssh-server
    p7zip-full
    ppa-purge
    proxychains
    python-soappy
    rsync
    rxvt-unicode-256color
    samba
    screen
    sed
    ssh
    sshfs
    supybot
    symlinks
    synaptic
    tmux
    tcpdump
    virt-manager
    wget
    wine
    zsh
    zsync'
    echo ''
    read -p 'Proceed? (Y)es, (N)o : ' REPLY
    case $REPLY in
    # Positive action
    [Yy]* )
        echo 'Requires root privileges:'
        # Feel free to change to whatever suits your preferences.
        sudo apt-get install -y --no-install-recommends aptitude dconf-tools openjdk-7-jdk openssh-server p7zip-full ppa-purge python-soappy samba ssh supybot symlinks synaptic virt-manager zsync sed fontconfig feh proxychains wine screen tmux lftp zsh sshfs fail2ban wget curl mpd dos2unix rxvt-unicode-256color gnupg htop mtr tcpdump awk nmap gparted
        echo 'Done.'
        clear && system
        ;;
    # Negative action
    [Nn]* )
        clear && system
        ;;
    # Error
    * )
        clear && echo 'Sorry, try again.'
        system
        ;;
    esac
    ;;
# Install Fingerprint Reader Software
2)
    # Add repository
    echo 'Adding Fingerprint Reader Team PPA to software sources...'
    echo 'Requires root privileges:'
    sudo apt-add-repository -y ppa:fingerprint/fingerprint-gui
    # Update repository information
    echo 'Updating repository information...'
    sudo apt-get update
    # Install package(s)
    echo 'Installing fingerprint reader software...'
    sudo apt-get install -y libbsapi policykit-1-fingerprint-gui fingerprint-gui
    echo 'Done.'
    system
    ;;
# Return
[Rr]*) 
    clear && main;;
# Invalid choice
* ) 
    clear && echo 'Not an option, try again.' && development;;
esac
}


# INSTALL GNOME COMPONENTS
function gnome {
echo ''
echo '1. Add GNOME3 PPA?'
echo '2. Add GNOME3 Staging PPA?'
echo '3. Add GNOME3 Next PPA?'
echo '4. Install GNOME Shell?'
echo '5. Install extra GNOME components?'
echo '6. Configure GNOME Shell Specific Settings?'
echo 'r. Return.'
echo ''
read -p 'What would you like to do? (Enter your choice) : ' REPLY
case $REPLY in
# Add GNOME3 PPA
1)
    # Add repository
    echo 'Adding GNOME3 PPA to software sources...'
    echo 'Requires root privileges:'
    sudo add-apt-repository -y ppa:gnome3-team/gnome3
    # Update repository information
    echo 'Updating repository information...'
    sudo apt-get update
    # Upgrade system
    echo 'Performing system upgrade...'
    sudo apt-get dist-upgrade -y
    echo 'Done.'
    echo ''
    gnome
    ;;
# Add GNOME3 Staging PPA
2)
    # Add repository
    echo 'Adding GNOME3 Staging PPA to software sources...'
    echo 'Requires root privileges:'
    sudo add-apt-repository -y ppa:gnome3-team/gnome3-staging
    # Update repository information
    echo 'Updating repository information...'
    sudo apt-get update
    # Upgrade system
    echo 'Performing system upgrade...'
    sudo apt-get dist-upgrade -y
    echo 'Done.'
    echo ''
    gnome
    ;;
# Add GNOME3 Next PPA
3)
    # Add repository
    echo 'Adding GNOME3 Next PPA to software sources...'
    echo 'Requires root privileges:'
    sudo add-apt-repository -y ppa:gnome3-team/gnome3-next
    # Update repository information
    echo 'Updating repository information...'
    sudo apt-get update
    # Upgrade system
    echo 'Performing system upgrade...'
    sudo apt-get dist-upgrade -y
    echo 'Done.'
    echo ''
    gnome
    ;;
# Install GNOME Shell
4)
    echo 'Installing GNOME Shell...'
    echo 'Requires root privileges:'
    sudo apt-get install -y gnome-shell gnome-shell-extensions gnome-session
    echo 'Done.'
    echo ''
    gnome
    ;;
# Install extra GNOME components
5)
    echo 'Installing extra GNOME components...'
    echo 'Requires the "gnome3-staging" and "gnome3-next" PPAs to be in the repositories.'
    echo ''
    echo 'Current package list:
    cheese
    gnome-boxes
    gnome-maps
    gnome-online-accounts
    gnome-weather'
    echo ''
    read -p 'Proceed? (Y)es, (N)o : ' REPLY
    case $REPLY in
    # Positive action
    [Yy]* )
        echo 'Requires root privileges:'
        # Feel free to change to whatever suits your preferences.
        sudo apt-get install -y cheese gnome-boxes gnome-maps gnome-online-accounts gnome-weather
        echo 'Done.'
        clear && gnome
        ;;
    # Negative action
    [Nn]* )
        clear && gnome
        ;;
    # Error
    * )
        clear && echo 'Sorry, try again.'
        gnome
        ;;
    esac
    ;;
# Configure Shell Specific Settings
6)
    # Font Settings
    echo 'Setting font preferences...'
    echo 'Requires the "Cantarell" font.'
    # Check if "fonts-cantarell" package is installed
    PACKAGE=$(dpkg-query -W --showformat='${Status}\n' fonts-cantarell | grep "install ok installed")
    echo "Checking if installed..."
    if [ "" == "$PACKAGE" ]; then
        echo 'Cantarell is not installed.'
        echo 'Installing... '
        echo 'Requires root privileges:'
        sudo apt-get install -y fonts-cantarell
        echo 'Done. '
    else
        echo 'Cantarell is installed, proceeding... '
    fi
    # Settings font settings
    gsettings set org.gnome.desktop.interface text-scaling-factor '1.0'
    gsettings set org.gnome.desktop.interface document-font-name 'Cantarell 12'
    gsettings set org.gnome.desktop.interface font-name 'Cantarell 12'
    gsettings set org.gnome.nautilus.desktop font 'Cantarell 12'
    gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Cantarell Bold 12'
    gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing 'rgba'
    gsettings set org.gnome.settings-daemon.plugins.xsettings hinting 'slight'
    echo 'Done. '
    # GNOME Shell Settings
    echo 'Setting GNOME Shell window button preferences...'
    gsettings set org.gnome.shell.overrides button-layout ':close'
    echo 'Done. '
    echo ''
    gnome
    ;;
# Return
[Rr]*) 
    clear && main;;
# Invalid choice
* ) 
    clear && echo 'Not an option, try again.' && gnome;;
esac
}


# INSTALL UBUNTU RESTRICTED EXTRAS
function codecinstall {
echo ''
read -p 'Install Ubuntu Restricted Extras? (Y)es, (N)o : ' REPLY
case $REPLY in
# Positive action
[Yy]* ) 
    echo 'Installing...'
    echo 'Requires root privileges:'
    sudo apt-get install -y ubuntu-restricted-extras
    echo 'Done.'
    main
    ;;
# Negative action
[Nn]* )
    clear && main;;
# Error
* )
    clear && echo 'Sorry, try again.' && codecinstall
esac
}

# INSTALL DEVELOPMENT TOOLS
function development {
echo ''
echo '1. Install development tools?'
echo '2. Install development libraries?'
echo '3. Install IDEs?'
echo 'r. Return'
echo ''
read -p 'What would you like to do? (Enter your choice) : ' REPLY
case $REPLY in
# Install Development Tools
1)
    echo 'Installing development tools...'
    echo ''
    echo 'Current package list:
    ant
    apache2
    devscripts
    emacs
    g++
    gdb
    git
    glade
    gnome-common
    gtk-3-examples
    heroku
    maven
    mongodb
    mysql-server
    mysql-workbench
    nginx
    nodejs
    npm
    perl
    php5
    postgresql
    python-launchpadlib
    python3-pip
    python3-distutils-extra
    ruby
    vim
    yeoman'
    echo ''
    read -p 'Proceed? (Y)es, (N)o : ' REPLY
    case $REPLY in
    # Positive action
    [Yy]* ) 
        echo 'Requires root privileges:'
        # Feel free to change to whatever suits your preferences.
        sudo apt-get install -y devscripts gcc-snapshot git glade gnome-common gtk-3-examples lib32stdc++6 nodejs python-launchpadlib python3-distutils-extra npm ant maven mongodb perl emacs gdb g++ ruby python-pip nginx apache2 vim php5 mysql-server postgresql mysql-workbench

        echo 'Getting yeoman...'
        #yeoman
        sudo npm install -g yo
        echo 'Done with yeoman.'

        echo 'Getting heroku...'
        #Heroku
        wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
        echo 'Done with heroku.'

        echo 'Done.'
        development
        ;;
    # Negative action
    [Nn]* )
        clear && development
        ;;
    # Error
    * )
        clear && echo 'Sorry, try again.'
        development
        ;;
    esac
    ;;
#Install development libraries
2)
    echo 'Installing development libraries'
    echo ''
    echo 'Current package list:
    mono-devel
    libboost-devel
    ncurses-base'
    echo ''
    read -p 'Proceed? (Y)es, (N)o : ' REPLY
    case $REPLY in
    # Positive action
    [Yy]* ) 
        echo 'Requires root privileges:'
        # Feel free to change to whatever suits your preferences.
        sudo apt-get install -y libboost-devel ncurses-base mono-devel

        echo 'Done.'
        development
        ;;
    # Negative action
    [Nn]* )
        clear && development
        ;;
    # Error
    * )
        clear && echo 'Sorry, try again.'
        development
        ;;
    esac
    ;;
#Install IDEs
3)
    echo 'Installing IDEs'
    echo ''
    echo 'Current package list:
    eclipse
    monodevelop
    phpstorm
    pycharm
    intelli-j'
    echo ''
    read -p 'Proceed? (Y)es, (N)o : ' REPLY
    case $REPLY in
    # Positive action
    [Yy]* ) 
        echo 'Requires root privileges:'
        # Feel free to change to whatever suits your preferences.
        sudo apt-get install -y eclipse monodevelop

        echo 'Done.'
        development
        ;;
    # Negative action
    [Nn]* )
        clear && development
        ;;
    # Error
    * )
        clear && echo 'Sorry, try again.'
        development
        ;;
    esac
    ;;
# Return
[Rr]*) 
    clear && main;;
# Invalid choice
* ) 
    clear && echo 'Not an option, try again.' && development;;
esac
}

# INSTALL DESIGN TOOLS
function design {
echo ''
echo 'Installing design tools...'
echo ''
echo 'Current package list:
fontforge
fontforge-extras
gimp
gimp-plugin-registry
gnuplot
icontool
imagemagick
inkscape'
echo ''
read -p 'Proceed? (Y)es, (N)o : ' REPLY
case $REPLY in
# Positive action
[Yy]* ) 
    echo 'Requires root privileges:'
    # Feel free to change to whatever suits your preferences.
    sudo apt-get install -y fontforge fontforge-extras gimp gimp-plugin-registry icontool imagemagick inkscape gnuplot
    echo 'Done.'
    main
    ;;
# Negative action
[Nn]* ) 
    clear && main;;
# Error
* )
    clear && echo 'Sorry, try again.' && design
    ;;
esac
}

# THIRD PARTY THEMES
function themes {
echo 'What would you like to install? '
echo ''
echo '1. Moka Icon Theme'
echo '2. Faba Icon Theme'
echo '3. Moka GTK Theme'
echo '4. Moka GNOME Shell Theme'
echo '5. Orchis GTK Theme'
echo 'r. Return'
echo ''
read -p 'Enter your choice: ' REPLY
case $REPLY in
# Moka Icon Theme
1)
    # Add repository
    echo 'Adding Moka Icon Theme repository to sources...'
    echo 'Requires root privileges:'
    sudo add-apt-repository ppa:moka/stable
    sudo add-apt-repository -y ppa:moka/moka-icon-theme
    # Update repository information
    echo 'Updating repository information...'
    echo 'Requires root privileges:'
    sudo apt-get update
    # Install package(s)
    echo 'Installing Moka icon themes...'
    echo 'Requires root privileges:'
    sudo apt-get install -y moka-icon-theme
    echo 'Done.'
    # Set Theme
    read -p "Do you want to set Moka as desktop theme? (Y)es, (N)o : " INPUT
    case $INPUT in
        [Yy]* ) 
            echo "Setting Moka as desktop Icon theme..."
            gsettings set org.gnome.desktop.interface icon-theme "Moka"
            echo "Done."
            themes
            ;;
        [Nn]* ) echo 'Done.'; themes;;
        * ) echo; echo "Uh oh, invalid response. Continuing without changes."; themes;;
    esac
    themes
    ;;
# Faba Icon Theme
2)
    # Add repository
    echo 'Adding Faba Icon Theme repository to sources...'
    echo 'Requires root privileges:'
    sudo add-apt-repository ppa:moka/stable
    sudo add-apt-repository -y ppa:moka/faba-icon-theme
    # Update repository information
    echo 'Updating repository information...'
    echo 'Requires root privileges:'
    sudo apt-get update
    # Install package(s)
    echo 'Installing Faba icon themes...'
    echo 'Requires root privileges:'
    sudo apt-get install -y faba-icon-theme faba-mono-icons faba-icon-theme-symbolic
    echo 'Done.'
    themes
    ;;
# Moka GTK Theme
3)
    # Add repository
    echo 'Adding Moka GTK Theme repository to sources...'
    echo 'Requires root privileges:'
    sudo add-apt-repository ppa:moka/stable
    sudo add-apt-repository -y ppa:moka/moka-gtk-theme
    # Update repository information
    echo 'Updating repository information...'
    echo 'Requires root privileges:'
    sudo apt-get update
    # Install package(s)
    echo 'Installing Moka GTK theme...'
    echo 'Requires root privileges:'
    sudo apt-get install -y moka-gtk-theme
    echo 'Done.'
    # Set Theme
    read -p "Do you want to set Moka as desktop theme? (Y)es, (N)o : " INPUT
    case $INPUT in
        [Yy]* )
            echo "Setting Moka as GTK window theme..."
            gsettings set org.gnome.desktop.wm.preferences theme "Moka"
            echo "Done."
            echo "Setting Moka as desktop GTK theme..."
            gsettings set org.gnome.desktop.interface gtk-theme "Moka"
            echo "Done."
            themes
            ;;
        [Nn]* ) echo 'Done.'; themes;;
        * ) echo; echo "Uh oh, invalid response. Continuing without changes."; themes;;
    esac
    themes
    ;;
# Moka GNOME Shell Theme
4)
    # Add repository
    echo 'Adding Moka GNOME Shell Theme repository to sources...'
    echo 'Requires root privileges:'
    sudo add-apt-repository ppa:moka/stable
    sudo add-apt-repository -y ppa:moka/moka-gnome-shell-theme
    # Update repository information
    echo 'Updating repository information...'
    echo 'Requires root privileges:'
    sudo apt-get update
    # Install package(s)
    echo 'Installing Moka GNOME Shell theme...'
    echo 'Requires root privileges:'
    sudo apt-get install -y moka-gnome-shell-theme
    echo 'Done.'
    themes
    ;;
# Orchis GTK Theme
5)
    # Add repository
    echo 'Adding Orchis GTK Theme repository to sources...'
    echo 'Requires root privileges:'
    sudo add-apt-repository ppa:moka/stable
    sudo add-apt-repository -y ppa:moka/orchis-gtk-theme
    # Update repository information
    echo 'Updating repository information...'
    echo 'Requires root privileges:'
    sudo apt-get update
    # Install package(s)
    echo 'Installing Orchis GTK theme...'
    echo 'Requires root privileges:'
    sudo apt-get install -y orchis-gtk-theme
    echo 'Done.'
    # Set Theme
    read -p "Do you want to set Orchis as desktop theme? (Y)es, (N)o : " INPUT
    case $INPUT in
        [Yy]* )
            echo "Setting Orchis as GTK window theme..."
            gsettings set org.gnome.desktop.wm.preferences theme "Orchis"
            echo "Done."
            echo "Setting Orchis as desktop GTK theme..."
            gsettings set org.gnome.desktop.interface gtk-theme "Orchis"
            echo "Done."
            themes
            ;;
        [Nn]* ) echo 'Done.'; themes;;
        * ) echo; echo "Uh oh, invalid response. Continuing without changes."; themes;;
    esac
    themes
    ;;
# Return
[Rr]*) 
    clear && customize;;
# Invalid choice
* ) 
    clear && echo 'Not an option, try again.' && themes;;
esac
}

# CUSTOMIZATION
function customize {
echo ''
echo '1. Configure system?'
echo '2. Install Third-Party themes?'
echo '3. Widget?'
echo 'r. Return'
echo ''
read -p 'What would you like to do? (Enter your choice) : ' REPLY
case $REPLY in
    1) clear && config;; # System Configuration
    2) clear && themes;; # Install Third-Party Themes
    3) clear && widgets;; # Install widgets
    [Rr]*) clear && main;; # Return
    * ) clear && echo 'Not an option, try again.' && customize;; # Invalid choice
esac
}

# THIRD PARTY APPLICATIONS
function thirdparty {
echo 'What would you like to install? '
echo ''
echo '1. Google Chrome?'
echo '2. Google Talk Plugin?'
echo '3. Google Music Manager?'
echo '4. Steam?'
echo '5. Sublime Text 3 (build 3059)?'
echo '6. Spotify client'
echo 'r. Return'
echo ''
read -p 'Enter your choice: ' REPLY
case $REPLY in
# Google Chrome
1) 
    echo 'Downloading Google Chrome...'
    # Download Debian file that matches system architecture
    if [ $(uname -i) = 'i386' ]; then
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
    elif [ $(uname -i) = 'x86_64' ]; then
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    fi
    # Install package(s)
    echo 'Installing Google Chrome...'
    echo 'Requires root privileges:'b
    sudo dpkg -i google-chrome*.deb
    sudo apt-get install -fy
    # Cleanup and finish
    rm google-chrome*.deb
    cd
    echo 'Done.'
    thirdparty
    ;;
# Google Talk Plugin
2)
    echo 'Downloading Google Talk Plugin...'
    # Download Debian file that matches system architecture
    if [ $(uname -i) = 'i386' ]; then
        wget https://dl.google.com/linux/direct/google-talkplugin_current_i386.deb
    elif [ $(uname -i) = 'x86_64' ]; then
        wget https://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb
    fi
    # Install package(s)
    echo 'Installing Google Talk Plugin...'
    echo 'Requires root privileges:'
    sudo dpkg -i google-talkplugin_current*.deb
    sudo apt-get install -fy
    # Cleanup and finish
    rm google-talkplugin_current*.deb
    cd
    echo 'Done.'
    thirdparty
    ;;
# Google Music Manager
3)
    echo 'Downloading Google Music Manager...'
    # Download Debian file that matches system architecture
    if [ $(uname -i) = 'i386' ]; then
        wget https://dl.google.com/linux/direct/google-musicmanager-beta_current_i386.deb
    elif [ $(uname -i) = 'x86_64' ]; then
        wget https://dl.google.com/linux/direct/google-musicmanager-beta_current_amd64.deb
    fi
    # Install package(s)
    echo 'Installing Google Music Manager...'
    echo 'Requires root privileges:'
    sudo dpkg -i google-musicmanager-*.deb
    sudo apt-get install -fy
    # Cleanup and finish
    rm google-musicmanager*.deb
    cd
    echo 'Done.'
    thirdparty
    ;;
# Steam
4)
    echo 'Downloading Steam...'
    cd $HOME/Downloads
    # Download Debian file that matches system architecture
    if [ $(uname -i) = 'i386' ]; then
        wget http://repo.steampowered.com/steam/archive/precise/steam_latest.deb
    elif [ $(uname -i) = 'x86_64' ]; then
        wget http://repo.steampowered.com/steam/archive/precise/steam_latest.deb
    fi
    # Install package(s)
    echo 'Installing Steam...'
    echo 'Requires root privileges:'
    sudo dpkg -i steam*.deb
    sudo apt-get install -fy
    # Cleanup and finish
    rm steam*.deb
    cd
    echo 'Done.'
    thirdparty
    ;;
# Sublime Text 3 (build 3059)
5)
    echo 'Downloading Sublime Text 3 (build 3059)...'
    # Download Debian file that matches system architecture
    if [ $(uname -i) = 'i386' ]; then
        wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3059_i386.deb
    elif [ $(uname -i) = 'x86_64' ]; then
        wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3059_amd64.deb
    fi
    # Install package(s)
    echo 'Installing Sublime Text 3 (build 3059)...'
    echo 'Requires root privileges:'
    sudo dpkg -i sublime-text_build-3059*.deb
    sudo apt-get install -fy
    # Create symbolic link
    echo 'Creating symbolic link...'
    echo 'Requires root privileges:'
    sudo ln -sf /opt/sublime_text/sublime_text /usr/bin/sublime
    echo 'Done.'
    # Cleanup and finish
    rm sublime-text_build-3059*.deb
    cd
    echo 'Done.'
    thirdparty
    ;;
# Spotify
6)
    # Add repository
    echo 'Adding Spotify repository to sources...'
    echo 'Creating apt list file...'
    touch spotify.list
    echo "deb http://repository.spotify.com stable non-free" >> spotify.list
    echo 'Moving spotify.list to /etc/apt/sources.list.d/'
    echo 'Requires root privileges:'
    sudo mv -f spotify.list /etc/apt/sources.list.d/
    echo 'Done.'
    # Update repository information
    echo 'Adding repository key and updating repository information...'
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
    sudo apt-get update
    # Install package(s)
    echo 'Installing Spotify client...'
    sudo apt-get install -y spotify-client
    echo 'Done.'
    thirdparty
    ;;
# Return
[Rr]*) 
    clear && main;;
# Invalid choice
* ) 
    clear && echo 'Not an option, try again.' && thirdparty;;
esac
}

#WIDGETS
function widgets {
echo ''
echo 'Current pacakge list:
conky
docky'

sudo apt-get install -y docky conky-all

    echo 'Done.'
    clear && customize
}

# CONFIG
function config {
echo ''
echo '1. Set preferred application-specific settings?'
echo '2. Show all startup applications?'
echo 'r. Return'
echo ''
read -p 'What would you like to do? (Enter your choice) : ' REPLY
case $REPLY in
# GSettings
1)
    # Font Sizes
    echo 'Setting font preferences...'
    gsettings set org.gnome.desktop.interface text-scaling-factor '1.0'
    gsettings set org.gnome.desktop.interface document-font-name 'Ubuntu 10'
    gsettings set org.gnome.desktop.interface font-name 'Ubuntu 10'
    gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono 11'
    gsettings set org.gnome.nautilus.desktop font 'Ubuntu 10'
    gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu Bold 9'
    gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing 'rgba'
    gsettings set org.gnome.settings-daemon.plugins.xsettings hinting 'slight'
    gsettings set org.gnome.desktop.default-applications.terminal exec 'urxvt'
    gsettings set org.gnome.desktop.default-applications.terminal exec-arg '-x'
    # Unity Settings
    echo 'Setting Unity preferences...'
    gsettings set com.canonical.Unity.ApplicationsLens display-available-apps false
    gsettings set com.canonical.unity-greeter draw-user-backgrounds true 
    gsettings set com.canonical.indicator.power icon-policy 'charge'
    gsettings set com.canonical.Unity.Lenses remote-content-search 'none'
    # Nautilus Preferences
    echo 'Setting Nautilus preferences...'
    gsettings set org.gnome.nautilus.preferences sort-directories-first true
    # Rhythmbox Preferences
    echo 'Setting Rhythmbox preferences...'
    gsettings set org.gnome.rhythmbox.rhythmdb monitor-library true
    gsettings set org.gnome.rhythmbox.sources browser-views 'artists-albums'
    # Done
    echo "Done."
    config
    ;;
# Startup Applications
2)
    echo 'Changing display of startup applications.'
    echo 'Requires root privileges:'    
    cd /etc/xdg/autostart/ && sudo sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop
    cd
    echo 'Done.'
    config
    ;;
# Return
[Rr]*) 
    clear && main;;
# Invalid choice
* ) 
    clear && echo 'Not an option, try again.' && config;;
esac
}

# CLEANUP SYSTEM
function cleanup {
echo ''
echo '1. Remove unused pre-installed packages?'
echo '2. Remove old kernel(s)?'
echo '3. Remove orphaned packages?'
echo '4. Remove leftover configuration files?'
echo '5. Clean package cache?'
echo 'r. Return?'
echo ''
read -p 'What would you like to do? (Enter your choice) : ' REPLY
case $REPLY in
# Remove Unused Pre-installed Packages
1)
    echo 'Removing selected pre-installed applications...'
    echo 'Requires root privileges:'
    sudo apt-get purge landscape-client-ui-install ubuntuone-control-panel* overlay*
    echo 'Done.'
    cleanup
    ;;
# Remove Old Kernel
2)
    echo 'Removing old Kernel(s)...'
    echo 'Requires root privileges:'
    sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | grep -v linux-libc-dev | xargs sudo apt-get -y purge
    echo 'Done.'
    cleanup
    ;;
# Remove Orphaned Packages
3)
    echo 'Removing orphaned packages...'
    echo 'Requires root privileges:'
    sudo apt-get autoremove -y
    echo 'Done.'
    cleanup
    ;;
# Remove residual config files?
4)
    echo 'Removing leftover configuration files...'
    echo 'Requires root privileges:'
    sudo dpkg --purge $(COLUMNS=200 dpkg -l | grep '^rc' | tr -s ' ' | cut -d ' ' -f 2)
    echo 'Done.'
    cleanup
    ;;
# Clean Package Cache
5)
    echo 'Cleaning package cache...'
    echo 'Requires root privileges:'
    sudo apt-get clean
    echo 'Done.'
    cleanup
    ;;
# Return
[Rr]*) 
    clear && main;;
# Invalid choice
* ) 
    clear && echo 'Not an option, try again.' && cleanup;;
esac
}

# INSTALL MISCELLANEOUS STUFF
function miscellany {
echo ''
echo 'Installing miscellany...'
echo ''
echo 'Current package list:
cmatrix
cowsay
dotfiles
fasd
fonts
fortune
homesick
scripts
todo
tty-clock
wallpapers'
echo ''
read -p 'Proceed? (Y)es, (N)o : ' REPLY
case $REPLY in
# Positive action
[Yy]* ) 
    echo 'Requires root privileges:'

    sudo apt-get install tty-clock fortune cowsay cmatrix

    #homesick
    sudo gem install homesick &&
    git clone git@bitbucket.org:jason-wang/dotfiles.git &&
    mv dotfiles ~/.homesick/repos/ &&
    homesick symlink dotfiles

    #fasd
    cd ~/Downloads &&
    curl -L https://github.com/clvv/fasd/tarball/1.0.1 | tar xz &&
    cd clvv* && sudo make install && cd .. && rm -rf clvv*

    #fonts
    sudo apt-get install -y fonts-inconsolata

    echo 'Done.'
    main
    ;;
# Negative action
[Nn]* ) 
    clear && main;;
# Error
* )
    clear && echo 'Sorry, try again.' && miscellany
    ;;
esac
}


# Quit
function quit {
read -p "Are you sure you want to quit? (Y)es, (N)o " REPLY
case $REPLY in
    [Yy]* ) exit 99;;
    [Nn]* ) clear && main;;
    * ) clear && echo 'Sorry, try again.' && quit;;
esac
}

#----- MAIN FUNCTION -----#
function main {
echo ''
echo '1. Perform system update & upgrade?'
echo '2. Install favorite applications?'
echo '3. Install favorite system utilities?'
echo '4. Install development tools?'
echo '5. Install design tools?'
echo '6. Install extra GNOME components?'
echo '7. Install Ubuntu Restricted Extras?'
echo '8. Install third-party applications?'
echo '9. Customize system?'
echo '10. Cleanup the system?'
echo '11. Miscellany?'
echo 'q. Quit?'
echo ''
read -p 'What would you like to do? (Enter your choice) : ' REPLY
case $REPLY in
    1) sysupgrade;; # System Upgrade
    2) clear && favorites ;; # Install Favorite Applications
    3) clear && system;; # Install Favorite Tools
    4) clear && development;; # Install Dev Tools
    5) clear && design;; # Install Design Tools
    6) clear && gnome;; # Install GNOME components
    7) clear && codecinstall;; # Install Ubuntu Restricted Extras
    8) clear && thirdparty;; # Install Third-Party Applications
    9) clear && customize;; # Customize system
    10) clear && cleanup;; # Cleanup System
    11) clear && miscellany;; # Miscellaneous apps
    [Qq]* ) echo '' && quit;; # Quit
    * ) clear && echo 'Not an option, try again.' && main;;
esac
}

#----- RUN MAIN FUNCTION -----#
main

#END OF SCRIPT
