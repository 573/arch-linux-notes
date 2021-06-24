# Still WIP
https://github.com/guibou/nixGL#opengl---hybrid-intel--nvidia-laptop states the problem:

```sh
NIX_PATH=nixpkgs=http://nixos.org/channels/nixpkgs-unstable/nixexprs.tar.xz nix-build https://github.com/guibou/nixGL/archive/master.tar.gz -A nixGLNvidiaBumblebee --no-out-link
```
(Approach to build nixGL for the nvidia card)

>cp: cannot stat '/proc/driver/nvidia/version': No such file or directory

https://wiki.archlinux.org/title/NVIDIA tells me to check graphics card via `lspci -k | grep -A 2 -E "(VGA|3D)"`

```log
00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor Integrated Graphics Controller (rev 06)
	Subsystem: Lenovo Device 221e
	Kernel driver in use: i915
--
01:00.0 VGA compatible controller: NVIDIA Corporation GK208M [GeForce GT 730M] (rev a1)
	Subsystem: Lenovo Device 221e
	Kernel driver in use: nouveau
```

(Later: https://wiki.archlinux.org/title/Intel_graphics)

and to look it up at the https://nouveau.freedesktop.org/CodeNames.html page. Searching `730M` there gives two results one of it for `GK208` (w/o the `M`, but this seems to stand for mobile/notebook) so I'll take that information.

The https://www.nvidia.com/en-us/drivers/unix/legacy-gpu/ page contains `GeForce GT 730 	0F02` now as an entry so IDK what to do with this ATM.

Still it seems to be a supported card as https://www.nvidia.com/Download/driverResults.aspx/153717/en-us states:

>GeForce 700M Series (Notebooks):
>
>GeForce GTX 780M, GeForce GTX 775M, GeForce GTX 770M, GeForce GTX 765M, GeForce GTX 760M, GeForce GT 755M, GeForce GT 750M, GeForce GT 745M, GeForce GT 740M, GeForce GT 735M, GeForce GT 730M, GeForce GT 720M, GeForce 710M

As the arch wiki tells me to install `nvidia` then I'll do.

(https://wiki.archlinux.org/title/bumblebee)
