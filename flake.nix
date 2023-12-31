{
  description = "A flake providing an overlay of packages by Musicaloft/municorn";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    arpeggio = {
      url = "git+https://codeberg.org/municorn/arpeggio?ref=main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    iosevka-muse = {
      url = "git+https://codeberg.org/municorn/iosevka-muse?ref=main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    matchpal = {
      url = "git+https://codeberg.org/municorn/matchpal?ref=dithering";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    muse-status = {
      url = "git+https://codeberg.org/municorn/muse-status?ref=unstable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    muse-sounds = {
      url = "git+https://codeberg.org/municorn/muse-sounds";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plymouth-theme-musicaloft-rainbow = {
      url = "git+https://codeberg.org/municorn/plymouth-theme-musicaloft-rainbow?ref=main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    arpeggio,
    iosevka-muse,
    matchpal,
    muse-sounds,
    muse-status,
    plymouth-theme-musicaloft-rainbow,
    ...
  }: {
    overlays.default = final: prev: {
      arpeggio = arpeggio.packages.${prev.system}.default;
      iosevka-muse = iosevka-muse.packages.${prev.system}.default;
      matchpal = matchpal.packages.${prev.system}.default;
      muse-sounds = muse-sounds.packages.${prev.system}.default;
      muse-status = muse-status.packages.${prev.system}.default;
      plymouth-theme-musicaloft-rainbow = plymouth-theme-musicaloft-rainbow.packages.${prev.system}.default;
    };
  };
}
