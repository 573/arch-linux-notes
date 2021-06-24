# Obsidian on Arch via nix

https://obsidian.md/ is a mardown editor with some extended functionality i. e. easier backlinks usage.

Their download is provided as an AppImage.

DEPRECATION NOTE: After a look at https://github.com/guibou/nixGL/issues/19 and the linked https://github.com/NixOS/nixpkgs/issues/9415#issuecomment-494960213 I felt like it's too time consuming to follow the nixGL route for now (sad BC there are many apps that could use a working approach though one of them vcvrack) and decided to just:

```sh
chmod +x DownloadedAppImage
./DownloadedAppImage
```

See below for later reference what I tried so far.

Using arch I still could use `appimage-run` via nixpkgs, but that required `nixGL`:

```sh
nix-shell -p nixpkgs.appimage-run --run "appimage-run ~/Downloads/Obsidian-0.12.5.AppImage"
```
>error while loading shared libraries: libxshmfence.so.1: cannot open shared object file: No such file or directory

Meaning (https://discourse.nixos.org/t/add-package-to-appimage-run-without-write-a-new-derivation/11888/2) OpenGL was needed which is what nixGL provides.

```nix
  environment.systemPackages = with pkgs; [
    (appimage-run.override {
      extraPkgs = pkgs: [ pkgs.xorg.libxshmfence ];
    })
  ];
```
(is what was suggested in the Discourse thread)

The first time I tried to build nixGL though nix tried to rebuild lots of stuff breaking thus I deactivated basically all my overlay files (`~/.config/nixpkgs/overlays/`) and the next basic build approach succeeded:

```sh
NIX_PATH=nixpkgs=http://nixos.org/channels/nixpkgs-unstable/nixexprs.tar.xz nix-build https://github.com/guibou/nixGL/archive/master.tar.gz -A nixGLIntel --no-out-link
```
(just one way to test the build of nixGL)

Roadblock, see note at this notes top:

> glxinfo Error: couldn't find RGB GLX visual or fbconfig
