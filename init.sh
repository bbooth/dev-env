#!/usr/bin/env bash

set -e
trap 'echo "Error occurred at line ${LINENO}"' ERR

err() { echo $1 1>&2; }

error_exit() {
	local msg

	msg=$1

	echo "error: ${msg}"		
	exit 1
}

installed() {
  local tool=$1
  
  test "command -v $tool &>/dev/null"
}

install_fish() {  
  if ! installed fish; then
    echo 'Fish missing'
    #echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_10/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
    #curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells:fish:release:3.gpg > /dev/null
    #sudo apt update
    #sudo apt install fish
  else
		echo 'Fish already installed' 
  fi      
}

install_fish
