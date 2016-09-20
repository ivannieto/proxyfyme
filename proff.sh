#! /bin/bash

echo -e 'Disabling system proxy'
gsettings set org.gnome.system.proxy mode 'none'
gsettings set org.gnome.system.proxy.http host ''
gsettings set org.gnome.system.proxy.http port 0
gsettings set org.gnome.system.proxy.https host ''
gsettings set org.gnome.system.proxy.https port 0
gsettings set org.gnome.system.proxy.ftp host ''
gsettings set org.gnome.system.proxy.ftp port 0

sudo grep PATH /etc/environment > lol.t;
sudo cat lol.t > /etc/environment;

sudo printf "" > /etc/apt/apt.conf.d/95proxies;

sudo rm -rf lol.t;

npm config set proxy null;
npm config set https-proxy null;

git config --global http.proxy "";
git config --global https.proxy "";
git config --unset http.proxy;
git config --unset https.proxy;


# OUTPUT
printf "**********************\nResume:\n\nEnv:\n"
cat /etc/environment;
printf "\n\nApt:"
cat /etc/apt/apt.conf.d/95proxies;
printf "\n\nNPM:"
npm config list;
printf "\n\nGIT:\n*** git http proxy:\n";
git config --get http.proxy;
printf "\n*** git https proxy:\n"
git config --get https.proxy;
