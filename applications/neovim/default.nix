{ pkgs, ... }:

{

  home.sessionVariables.EDITOR = "nvim";
  programs.neovim = {
    vimAlias = true;
    enable = true;
    withPython3 = true;

    plugins= with pkgs.vimPlugins; [
      {
        plugin=vimspector;
        config=''
          nnoremap <leader>m :MaximizerToggle!<CR>
          nnoremap <leader>dd :call vimspector#Launch()<CR>
          nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
          nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
          nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
          nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
          nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
          nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
          nnoremap <leader>de :call vimspector#Reset()<CR>
          
          nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>
          
          nmap <leader>dl <Plug>VimspectorStepInto
          nmap <leader>dj <Plug>VimspectorStepOver
          nmap <leader>dk <Plug>VimspectorStepOut
          nmap <leader>d_ <Plug>VimspectorRestart
          nnoremap <leader>d<space> :call vimspector#Continue()<CR>
          
          nmap <leader>drc <Plug>VimspectorRunToCursor
          nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
          nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
          fun! GotoWindow(id)
            call win_gotoid(a:id)
            MaximizerToggle
          endfun
       '';
      }
      vim-nix
      coc-nvim
      coc-tsserver
      coc-yaml
      coc-json
      coc-prettier
      fzf-vim
      vim-tmux-navigator
      vim-dispatch
      { 
        plugin=nerdtree;
        config = '' 
          map <C-n> :NERDTreeToggle<CR>
          let g:NERDTreeGitStatusUseNerdFonts = 1
          let g:nerdtree_tabs_autoclose=0
      '';
      }
      nerdtree-git-plugin
      vim-devicons
      vim-nerdtree-syntax-highlight
    ];
    extraConfig = ''
      source $HOME/.config/nvim/plug-config/coc.vim
      set nocompatible
      filetype plugin indent on                        " enable filetype detection
      set tabstop=4
      set shiftwidth=4
      set expandtab
      let mapleader = " "
      '';
  };
  xdg.configFile."nvim/coc-settings.json".text = "{}";
  xdg.configFile."nvim/plug-config/coc.vim".source= ./plug-config/coc.vim;

}
