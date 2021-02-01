#!/usr/bin/env python3
import logging
import pathlib
import subprocess


def resolved_path(s):
    p = pathlib.Path(s).resolve()
    return p


def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "sha256sum",
        metavar="HASH",
        help="SHA256 sum of the image for the test phase"
    )
    parser.add_argument(
        "image",
        metavar="ISO",
        type=resolved_path,
        help="ISO image to write"
    )
    parser.add_argument(
        "device",
        metavar="DEV",
        type=resolved_path,
        help="Device to write the ISO to"
    )

    args = parser.parse_args()

    if not args.image.is_file():
        logging.warning("is not a simple file: %s", args.image)

    if not args.device.is_block_device():
        logging.warning("is not a block device: %s", args.device)

    print(
        "I am going to ERASE ALL DATA on {}. "
        "Are you sure this is okay?".format(
            args.device
        )
    )
    confirm = input("Type uppercase YES> ")
    if confirm != "YES":
        print("That's not a YES. Bailing out.")
        return 2

    size = args.image.stat().st_size

    bs = 4096
    if size / bs != size // bs:
        logging.warning(
            "size not divisible by block size, check will be slow"
        )
        bs = 1
        count = size
    else:
        count = size // bs

    print(
        "WRITING {} BYTES TO {}".format(
            size,
            args.device
        )
    )
    subprocess.check_call(
        [
            "dd",
            "status=progress",
            "conv=fdatasync",
            "oflag=direct",
            "if={}".format(args.image),
            "of={}".format(args.device),
            "bs=4k",
        ]
    )

    print("CHECKING")
    shasum = subprocess.Popen(
        [
            "sha256sum",
        ],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
    )

    dd_check = subprocess.Popen(
        [
            "dd",
            "status=progress",
            "count={}".format(count),
            "bs={}".format(bs),
            "if={}".format(args.device),
        ],
        stdout=shasum.stdin,
    )
    shasum.stdin.close()

    dd_check.wait()
    shasum.wait()
    shasum = shasum.stdout.read().decode().split()[0]

    if shasum != args.sha256sum:
        print("CHECK FAILED: HASH MISMATCH")
        rc = 1
    else:
        print("CHECK PASSED")
        rc = 0
        try:
            subprocess.check_call([
                "eject",
                str(args.device),
            ])
        except subprocess.CalledProcessError:
            logging.warning("eject failed")

    print("expected: {}".format(args.sha256sum))
    print("got     : {}".format(shasum))

    return rc

if __name__ == "__main__":
    import sys
    sys.exit(main() or 0)
