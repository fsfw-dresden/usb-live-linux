### TODO / Roadmap for further development

- **collection of tutorials and walk-throughs** <= Contributions most welcome!
- update documentation of repository structure
- multi-language boot
- portableapps scripted install with [pint](https://github.com/vensko/pint) or [scoop](https://github.com/lukesampson/scoop) ?
- bullseye (testing) / KDE 5.18 variant [](../variants.build/TEST-Plasmastick:KDE:testing) (untested)
- upstreaming of live-boot / live-config modifications
- generalizing away from using live-build (vmdb2 + ansible?)
- ISO Upgrades? c.f. https://tails.boum.org/blueprint/Endless_upgrades/ https://github.com/rauc/rauc/

### Known issues (2021-04-03)
- no stick install GUI (implement with pyside / qml)
- night mode settings GUI in progress (implement with pyside / qml)
- boot failure with newer nvidia chipsets (lernstick has support, also for CUDA apps like [meshroom](https://github.com/alicevision/meshroom/))
- multi-variant inheritance?
- no portableapps on first partition yet
- enable kernel-updates / create update-initramfs wrapper for our partition layout

2016-10-21 13:22 gerdg-dd 092a2a1 # TODO:
2016-10-21 13:22 gerdg-dd 092a2a1 # Windows Programme downoad & copieren auf WIN-DATEN Partition
2016-10-21 13:22 gerdg-dd 092a2a1 # usb-live-linux/doc/src/windows.md     - anpassen [Programm] (download-path-programm.zip *.exe ..*.etc )
2016-10-21 13:22 gerdg-dd 092a2a1 #script win-daten_download.sh
2016-10-26 19:41 gerd     2cb3165 #script win-daten_copy.sh
2016-10-26 19:41 gerd     2cb3165 #
2016-10-26 19:41 gerd     2cb3165
2016-10-26 19:41 gerd     2cb3165 # TODO:
2016-10-26 19:41 gerd     2cb3165 # Distribution / Verteilung Script
2016-10-26 19:41 gerd     2cb3165 # script Uni_Stick_distri.show
2016-10-26 19:41 gerd     2cb3165 #
2016-10-26 19:41 gerd     2cb3165 # pack USBImage (ZIP)
2016-10-26 19:41 gerd     2cb3165 # make Checksums (PGP, MD5, SHA256, SHA512)
2016-10-26 19:41 gerd     2cb3165 # create Torrent with Webseed
2016-10-26 19:41 gerd     2cb3165 # create Magnet Link
