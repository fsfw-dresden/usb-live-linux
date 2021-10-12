## ATTENTION

- FIXME: transform into deb package so calamares can remove it when installing to disk
- ADD: /var/lib/live/config
- ADD: /usr/lib/locale ( 10,0 MiB locale-archive )
- FIXME: overlapping multi-mounts (race condition?) :
  #    tmpfs /run tmpfs rw,nosuid,noexec,relatime,size=802512k,mode=755 0 0
  #    tmpfs /dev/shm tmpfs rw,nosuid,nodev 0 0
  #    tmpfs /run/lock tmpfs rw,nosuid,nodev,noexec,relatime,size=5120k 0 0
  #    tmpfs /sys/fs/cgroup tmpfs ro,nosuid,nodev,noexec,size=4096k,nr_inodes=1024,mode=755 0 0
  # => tmpfs /run/var/tmp tmpfs rw,noatime 0 0
  #    tmpfs /run/var/lib/apt/lists tmpfs rw,noatime 0 0
  # => tmpfs /run/tmp tmpfs rw,noatime 0 0
  #    tmpfs /run/var/cache/apt tmpfs rw,noatime 0 0
  # => tmpfs /run/var/tmp tmpfs rw,noatime 0 0
  # => tmpfs /run/tmp tmpfs rw,noatime 0 0
  # => tmpfs /run/tmp tmpfs rw,noatime 0 0
  # => tmpfs /run/var/tmp tmpfs rw,noatime 0 0
  #    tmpfs /run/user/1000 tmpfs rw,nosuid,nodev,relatime,size=802508k,nr_inodes=200627,mode=700,uid=1000,gid=1000 0 0
