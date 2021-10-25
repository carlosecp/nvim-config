function sumneko_lua() {
	sudo pacman -S ninja
	gh repo clone sumneko/lua-language-server $HOME/lsp/lua-language-server
	cd $HOME/lsp/lua-language-server
	git submodule update --init --recursive

	cd 3rd/luamake
	./compile/install.sh
	cd ../..
	./3rd/luamake/luamake rebuild
}

function clangd() {
	sudo pacman -S clangd
}
