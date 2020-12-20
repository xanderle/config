{ config, lib, pkgs, ... }: 


{
  programs.zsh = {
    enable = true;
#     plugins = [
#            {
#              # will source zsh-autosuggestions.plugin.zsh
#              name = "zsh-autosuggestions";
#              src = pkgs.fetchFromGitHub {
#                owner = "zsh-users";
#                repo = "zsh-autosuggestions";
#                rev = "v0.4.0";
#                sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
#              };
#            }
#            {
#              name = "enhancd";
#              file = "init.sh";
#              src = pkgs.fetchFromGitHub {
#                owner = "b4b4r07";
#                repo = "enhancd";
#                rev = "ae315ded4dba10685dbbafbfa2ff3c1aefeb490d";
#                sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
#              };
#            }
#          ];
  };
  programs.starship = {
    enable = true;
  };
}

