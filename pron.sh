#! /bin/bash

# Checks for arguments passed
if [ $# -eq 2 ]; then
    host=$1
    port=$2

    # gsettings
    gsettings set org.gnome.system.proxy mode manual
    gsettings set org.gnome.system.proxy.http host $host
    gsettings set org.gnome.system.proxy.http port $port
    gsettings set org.gnome.system.proxy.https host $host
    gsettings set org.gnome.system.proxy.https port $port
    gsettings set org.gnome.system.proxy.ftp host $host
    gsettings set org.gnome.system.proxy.ftp port $port

    # env vars
    grep PATH /etc/environment > env.bak;
    printf \
    "http_proxy=http://$host:$port/\n\
    https_proxy=http://$host:$port/\n\
    ftp_proxy=http://$host:$port/\n\
    no_proxy=\"localhost,127.0.0.1,localaddress,.localdomain.com\"\n\
    HTTP_PROXY=http://$host:$port/\n\
    HTTPS_PROXY=http://$host:$port/\n\
    FTP_PROXY=http://$host:$port/\n\
    NO_PROXY=\"localhost,127.0.0.1,localaddress,.localdomain.com\"\n" >> env.bak;

    cat env.bak > /etc/environment;

    # apt
    echo "Acquire::http::proxy \"http://$host:$port/\";" >> /etc/apt/apt.conf.d/95proxies
    echo "Acquire::https::proxy \"ftp://$host:$port/\";" >> /etc/apt/apt.conf.d/95proxies
    echo "Acquire::ftp::proxy \"https://$host:$port/\";" >> /etc/apt/apt.conf.d/95proxies

    sudo rm -rf env.bak;

    # npm
    npm config set proxy http://$host:$port/;
    npm config set https-proxy http://$host:$port/;
    npm condif set strict-ssl false;

    # git
    git config --global http.proxy "http://$host:$port";
    git config --global https.proxy "http://$host:$port";


    # Output
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

  else

    printf "Usage $0 <proxy_ip> <proxy_port>\n";
fi
