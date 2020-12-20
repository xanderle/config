{ pkgs, ... }:

{

  home.sessionVariables.EDITOR = "nvim";
  programs.neovim = {
  vimAlias = true;
    enable = true;
    extraConfig=builtins.readFile ./vimrc;
    withPython3 = true;

    plugins= with pkgs.vimPlugins; [
	vimspector
	vim-nix
	coc-nvim
	coc-tsserver
	coc-yaml
	coc-json
	coc-prettier
	fzf-vim
	vim-tmux-navigator
	vim-dispatch
	nerdtree
        ];
    };
  xdg.configFile."nvim/coc-settings.json".text = "{}";
  xdg.configFile."nvim/plug-config/coc.vim".source= ./plug-config/coc.vim;

}
