# proxyfy-me

#### *Proxy network configuration script for Ubuntu based distros. Tested from 14.04 LTS and latest releases*

____

What can this script do for you? No, it won't serve you a delicious Manhattan, BUT, it aims to make your life easier.

Actually this script tries to proxyfy:

* apt
* gsettings
* git
* npm

That way you won't need to loose your precious time editing a bunch of files manually when using a proxified network.

## How to install

##### [SSH]
*Copy and paste this code in your terminal*

    git clone git@github.com:ivannieto/proxyfyme.git && \
    cd proxyfy-me/ && \
    sudo chmod +x ./proxyfyme.sh && \
    sudo chmod +x ./pron.sh && \
    sudo chmod +x ./proff.sh && \
    sudo cp ./proxyfyme.sh /usr/local/bin/proxyfyme && \
    sudo cp ./pron.sh /usr/local/bin/ && \
    sudo cp ./proff.sh /usr/local/bin/

##### [HTTPS]
*Copy and paste this code in your terminal*

    git clone https://github.com/ivannieto/proxyfy-me.git && \
    cd proxyfy-me/ && \
    sudo chmod +x ./proxyfyme.sh && \
    sudo chmod +x ./pron.sh && \
    sudo chmod +x ./proff.sh && \
    sudo cp ./proxyfyme.sh /usr/local/bin/proxyfyme && \
    sudo cp ./pron.sh /usr/local/bin/ && \
    sudo cp ./proff.sh /usr/local/bin/

##### [ZIP]
*Copy and paste this code in your terminal*

    sudo apt-get install -y unzip && \
    unzip proxyfy-me.zip -d ./ && \
    cd proxyfy-me && \
    sudo chmod +x ./proxyfyme.sh && \
    sudo chmod +x ./pron.sh && \
    sudo chmod +x ./proff.sh && \
    sudo cp ./proxyfyme.sh /usr/local/bin/proxyfyme && \
    sudo cp ./pron.sh /usr/local/bin/ && \
    sudo cp ./proff.sh /usr/local/bin/

# How to use proxyfy-me

Just type in your terminal the following syntax:

    proxyfyme <HOST> <PORT>

Example:

    proxyfyme 10.100.13.3 3128

You'll be prompted for your root password, and...

    Set Proxy? [s] or Disable Proxy [d]

So simple. So sweet.

_____

### PRs accepted

###### Work based on the script proposed as answer by Pablo Bianchi on [askubuntu][1]

[1]: http://askubuntu.com/questions/150210/how-do-i-set-systemwide-proxy-servers-in-xubuntu-lubuntu-or-ubuntu-studio#151047
