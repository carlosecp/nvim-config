#!/bin/sh

check_dependencies() {
	if ! [ -x "$(command -v gcc)" ] 
	then
		echo "🛑 ERROR - Unmet Dependency GCC"
		exit
	fi

	if ! [ -x "$(command -v node)" ] 
	then
		echo "🛑 ERROR - Unmet Dependency NodeJS"
		exit
	fi
}

check_conflict() {
	if [ -d "$HOME/.config/nvim" ]
	then
		echo "🛑 ERROR - Config already exists at $HOME/.config/nvim"
		exit
	fi
}

install() {
	check_dependencies
	check_conflict
	git clone https://github.com/itscarlosecp/itscarlosecp.nvim $HOME/.config/nvim
	nvim +PackerSync
}

install
