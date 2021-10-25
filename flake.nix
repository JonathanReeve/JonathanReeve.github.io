{
  description = "Jonreeve.com: Personal website for Jonathan Reeve.";
  inputs = {
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
    rib = { url = "github:srid/rib?rev=3f790f22e477d4a833945a9ed4d6e04adbc34747"; flake = false; };
    # Pin nixpkgs
    nixpkgs = { url = "github:NixOS/nixpkgs/5272327b81ed355bbed5659b8d303cf2979b6953"; flake = false; }; # 20.03
  };
  outputs = { self, nixpkgs, ... }@inputs: {
    packages.x86_64-linux.jonreevecom =
      with import nixpkgs { system = "x86_64-linux"; config = { allowBroken = true; }; };
      pkgs.haskellPackages.developPackage {
        root = ./.;
        name = "jonreevecom";
        source-overrides = {
          mmark = pkgs.fetchFromGitHub { owner = "mmark-md";
                                         repo = "mmark";
                                         rev = "2eae69376535f9d41d9b1a00d6bced522e978799";
                                         sha256 = "QRk+BKBpnl8F4le6Cjk7qGZZ17XxJpJVLdGjGQXHFIc=";
                                       };
          hashable = pkgs.fetchFromGitHub { owner = "haskell-unordered-containers";
                                            repo = "hashable";
                                            rev = "af096474a623fca209b23f617b044e6a6ab754c8";
                                            sha256 = "j0cu3mEQFbaWSTIV0fUDZHfXo6t28dLYyuELPAC4Tb4=";
                                          };
          # dhall = pkgs.fetchFromGitHub { owner = "dhall-lang"; repo = "dhall-haskell";
          #                                rev = "9afffaea7108a86df197cb97b64a9504fe37ecfc";
          #                                sha256 = "gdWQhIehqWqLFwOdhcoKaD5u4rxc6tEFwHBqk+H6wBE=";
          #                              };
          # aeson = pkgs.fetchFromGitHub { owner = "";
          #                                repo = "";
          #                                rev = "";
          #                                sha256 = "";
          #                              };
        };
      };
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.jonreevecom;
    devShell = true;
  };
}
