{ pkgs, ... }: {
  imports = [ 
    ./applications/alacritty
    ./applications/zsh 
    ./applications/neovim 
    ./applications/git
    ./applications/fzf
    ./applications/direnv
    ./applications/tmux ];
	
#  nixpkgs.overlays = [
#    (self: super: {
#      rdm = super.stdenv.mkDerivation rec {
#          name = "rdm";
#          src = super.fetchFromGitHub {
#            owner = "avibrazil";
#            repo = "RDM";
#            rev = "77decb5b66e96ee0e35f0d3c0187c936f033598c";
#            sha256 = "00zsjd1y08cw6bj8kkyx89v8d746fk9rfcnm545bml7z30aa16cb";
#      };
#      buildInputs = [super.clang];
#      };
#    })
#  ];
    #home.sessionVariables = { GOROOT = ["${pkgs.go.out}/share/go"];};
    home.packages = with pkgs; [
      asciinema
      go
      silver-searcher
      ripgrep
      kubectl
      openssl
      openssl.dev
      kubernetes-helm
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
