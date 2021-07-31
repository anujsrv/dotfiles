#!/usr/bin/env bash

INSTALL_DIR="$HOME/.local/share/installed-lsp-servers/"

echo "installation directory: $INSTALL_DIR"
mkdir -p $INSTALL_DIR
cd $INSTALL_DIR

if [ "$1" = "python" ]; then
    echo "installing pyright-langserver"
    npm install pyright
    ln -s "./node_modules/.bin/pyright-langserver" .
elif [ "$1" = "go" ]; then
    echo "installing gopls"
    if [ "$2" != "" ]; then
        GOPATH=$(pwd) GOBIN=$(pwd) GOROOT=$2 GO111MODULE=on $2/bin/go get -v golang.org/x/tools/gopls@latest
        GOPATH=$(pwd) GOROOT=$2 GO111MODULE=on $2/bin/go clean -modcache
    else
        GOPATH=$(pwd) GOBIN=$(pwd) GO111MODULE=on go get -v golang.org/x/tools/gopls@latest
        GOPATH=$(pwd) GO111MODULE=on go clean -modcache
    fi
    rm -rf src pkg 2> /dev/null
elif [ "$1" = "java" ]; then
    echo "installing eclipse-jdtls"
    wget "https://ftp.fau.de/eclipse/jdtls/snapshots/jdt-language-server-latest.tar.gz"
    mkdir eclipse-jdtls
    tar -xvf jdt-language-server-latest.tar.gz -C eclipse-jdtls
    rm jdt-language-server-latest.tar.gz
else
    echo "unknown option: $1"
fi
