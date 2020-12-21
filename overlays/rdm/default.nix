self: super: {

RDM = with super; stdenv.mkDerivation {
  name = "RDM";
  src = fetchFromGitHub {
    owner= "avibrazil";
    repo = "RDM";
    rev = "77decb5b66e96ee0e35f0d3c0187c936f033598c";
    sha256 = "00zsjd1y08cw6bj8kkyx89v8d746fk9rfcnm545bml7z30aa16cb";
  };
}

