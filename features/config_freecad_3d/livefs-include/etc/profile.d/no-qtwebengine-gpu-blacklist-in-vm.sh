# needed to make 3DfindIT addon not fail in VM
systemd-detect-virt -vq && export QTWEBENGINE_CHROMIUM_FLAGS="--ignore-gpu-blacklist"
