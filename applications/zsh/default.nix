{ config, lib, pkgs, ... }: 


{
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    initExtra = ''
      setopt vi
      export FZF_DEFAULT_OPTS="
      --ansi
      --layout=default
      --info=inline
      --height=50%
      --multi
      --preview-window=right:50%
      --preview-window=sharp
      --preview-window=cycle
      --preview '([[ -f {} ]] && (bat --style=numbers --color=always --theme=gruvbox --line-range :500 {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
      --prompt='λ -> '
      --pointer='|>'
      --marker='✓'
      --bind 'ctrl-e:execute(nvim {} < /dev/tty > /dev/tty 2>&1)' > selected
      --bind 'ctrl-v:execute(code {+})'"
      export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
      export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
      zstyle ':completion:*' completer _expand _complete _ignored _approximate
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
      zstyle ':completion:*' menu select=2
      zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
      zstyle ':completion:*:descriptions' format '-- %d --'
      zstyle ':completion:*:processes' command 'ps -au$USER'
      zstyle ':completion:complete:*:options' sort false
      zstyle ':fzf-tab:complete:_zlua:*' query-string input
      zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
      zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'

      '';
    plugins = [
      {
         name = "fzf-tab";
          file = "fzf-tab.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "Aloxaf";
            repo = "fzf-tab";
            rev = "cb8a784343a422ba6d8bdf60acaf4714a6a6d5f7";
            sha256 = "0255whjb3k526q1276z21w6lvalx0b2q6jsd571l69ks1bx7mr9g";
          };
      }
      {
        name = "enhancd";
        file = "init.sh";
        src = pkgs.fetchFromGitHub {
          owner = "b4b4r07";
          repo = "enhancd";
          rev = "ae315ded4dba10685dbbafbfa2ff3c1aefeb490d";
          sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
        };
      }
    ];
  };
  programs.starship = {
    enable = true;
  };
}

