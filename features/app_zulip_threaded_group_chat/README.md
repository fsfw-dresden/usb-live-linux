# Note (2022-03-23)
The .deb package provided by zulip.com depends on libappindicator3-1
which is succeeded by libayatana-appindicator3-1 package, c.f.:
https://github.com/zulip/zulip-desktop/issues/1168

The schulstick-apt-repo contains a dummy packages that satisfies the
dependency and makes zulip installable on debian. However, desktop
notifications might not be fully functional due to that.
