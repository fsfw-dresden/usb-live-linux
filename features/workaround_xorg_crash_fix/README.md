## Workaround for Xorg crash in OsLookupColor (added 2024-12-10)

- Xorg always crashes on first start in Qemu, also when starting several apps
- upstream bug is https://gitlab.freedesktop.org/xorg/xserver/-/issues/1053
- Matthew Ruffell (mruffell) has posted a PPA with packages that disable the
  assertion causing the crash, see comment #31 on the relevant ubuntu bug:
  https://bugs.launchpad.net/ubuntu/+source/xorg-server/+bug/1861609
- https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1608 still
  waiting for approval ...
