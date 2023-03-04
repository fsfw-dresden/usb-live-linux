### TODO / Development Roadmap

- welcome portal with **collection of tutorials and walk-throughs** <= Contributions most welcome!
- multi-language boot
- review and improve package list zoning
- enable kernel-updates / create update-initramfs wrapper for our partition layout
- add [portableapps](https://portableapps.com/) on first partition ?
- portableapps scripted install with [pint](https://github.com/vensko/pint) or [scoop](https://github.com/lukesampson/scoop) ?
- bring back KDE variant [](../variants.build/TEST-Plasmastick:KDE:testing) (untested)
- upstreaming of live-boot / live-config modifications
- convert features into packages using [makedeb](https://makedeb.org/) [PKGBUILD](https://docs.makedeb.org/makedeb/pkgbuild-syntax/) files vs
- generalizing away from using live-build (vmdb2 + ansible?)
- multi-variant inheritance?
- ISO Upgrades? c.f. https://tails.boum.org/blueprint/Endless_upgrades/ https://github.com/rauc/rauc/
- ImageMagick policies ?

### Known issues (2021-04-03)
- no stick duplication GUI yet
- boot problems on some newer nvidia chipsets (lernstick has better support, also for CUDA apps)
