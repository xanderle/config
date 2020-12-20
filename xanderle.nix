{ pkgs, ... }: {
  imports = [ 
    ./applications/alacritty
    ./applications/zsh 
    ./applications/neovim 
    ./applications/git
    ./applications/tmux ];
	
    home.packages = with pkgs; [
 	atool 
	httpie
	weechat
	exa
	bat
	lazygit
	lazydocker
	nodejs
	yarn
    ];
}	
