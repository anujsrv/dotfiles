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
    ver=`go version | { read _ _ v _; echo ${v#go}; }`
    echo "installing gopls"
    echo "detected golang version: " $ver
    if [[ "$ver" > "1.17.1" ]]; then
        GOPATH=$(pwd) GOBIN=$(pwd) go install -v golang.org/x/tools/gopls@latest
    else
        if [ "$2" != "" ]; then
            GOPATH=$(pwd) GOBIN=$(pwd) GOROOT=$2 GO111MODULE=on $2/bin/go get -v golang.org/x/tools/gopls@latest
            GOPATH=$(pwd) GOROOT=$2 GO111MODULE=on $2/bin/go clean -modcache
        else
            GOPATH=$(pwd) GOBIN=$(pwd) GO111MODULE=on go get -v golang.org/x/tools/gopls@latest
            GOPATH=$(pwd) GO111MODULE=on go clean -modcache
        fi
    fi
    rm -rf src pkg 2> /dev/null
elif [ "$1" = "java" ]; then
    echo "installing eclipse-jdtls"
    # download the version of jdtls from eclipse in given location
    wget -q --show-progress --progress=bar:force:noscroll "https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.31.0/jdt-language-server-1.31.0-202401111522.tar.gz" -O jdt-language-server.tar.gz
    mkdir eclipse-jdtls
    tar -xvf jdt-language-server.tar.gz -C eclipse-jdtls
    rm jdt-language-server.tar.gz
else
    echo "unknown option: $1"
fi
