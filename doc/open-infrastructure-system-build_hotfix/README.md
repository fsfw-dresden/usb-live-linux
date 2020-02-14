# open-infrastructure-system-build hotfix für FSFW-Uni-Stick

### Fehlermeldung:

```
...
Reading package lists...
W: GPG error: http://www.deb-multimedia.org buster InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 5C808C2B65558117
E: The repository 'http://www.deb-multimedia.org buster InRelease' is not signed.
P: Begin unmounting filesystems...
P: Saving caches...
...
```

* build bricht ab wenn sich Pakete in config/packages.chroot befinden

    Fehler in /lib/live/build/chroot_archives

Zeile 263    Apt chroot update –> löst Fehler aus da noch *.key Files fehlen 


#### hotfix

in das Verzeichnis wechseln

cd $(repo_root)/doc/open-infrastructure-system-build_hotfix

Patch anwenden - original Datei bleibt mit -b backup erhalten 

sudo patch -b -p0 /lib/live/build/chroot_archives < ./hotfix_chroot_archives.patch
