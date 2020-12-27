{ pkgs, ... }: {
  imports = [ 
    ./applications/alacritty
    ./applications/zsh 
    ./applications/neovim 
    ./applications/git
    ./applications/fzf
    ./applications/tmux ];
	
    home.packages = with pkgs; [
      ripgrep
      kubectl
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
