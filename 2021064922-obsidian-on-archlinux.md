https://obsidian.md/ is a mardown editor with some extended functionality i. e. easier backlinks usage.

Their download is provided as an AppImage.

Using arch I still could use `appimage-run` via nixpkgs, but that required `nixGL`:

```sh
nix-shell -p nixpkgs.appimage-run --run "appimage-run ~/Downloads/Obsidian-0.12.5.AppImage"
```
>error while loading shared libraries: libxshmfence.so.1: cannot open shared object file: No such file or directory

Meaning (https://discourse.nixos.org/t/add-package-to-appimage-run-without-write-a-new-derivation/11888/2) OpenGL was needed which is what nixGL provides.

The first time I tried to build nixGL though nix tried to rebuild lots of stuff breaking thus I deactivated basically all my overlay files (`~/.config/nixpkgs/overlays/`) and the next basic build approach succeeded:

```sh
NIX_PATH=nixpkgs=http://nixos.org/channels/nixpkgs-unstable/nixexprs.tar.xz nix-build https://github.com/guibou/nixGL/archive/master.tar.gz -A nixGLIntel --no-out-link
```
(just one way to test the build of nixGL)

