{ config, lib, pkgs, ... }:

{
  programs.tmux = {
	enable = true;
	plugins = with pkgs.tmuxPlugins; [
vim-tmux-navigator
tmux-fzf
resurrect
];

};
}
