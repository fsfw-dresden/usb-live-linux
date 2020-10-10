## Features in usb-live-linux

Although this construct was inspired by the [features folder in tails](https://git-tails.immerda.ch/tails/tree/features), it works differently. While tails describes feature scenarios / test cases, here the individual features are the actual meat, i.e. the scripts and scaffolding that implement the feature.
Each feature can be included by a relative symlink in the features folder of a [variant](../variants).
Each variant can also define its own private features there instead of sym-linking from this common features folder.

### Naming
The feature names try to be as descriptive and concise as possible.

### Scope prefixes
Each feature name starts with a scope prefix. For that, there are no defined rules yet, current (2020-10-10) distribution of prefixes (including several unreleased features) is as follows:

     88 config
     48 app
     44 package-list
     10 workaround
     10 live
      9 package-repo
      9 desktop
      4 package-preference
      4 lang
      4 hook
      2 live-boot
      2 driver
      1 stuff
      1 menu-override
      1 firmware
      1 debug
      1 appimage

### Dependencies
A feature may declare its dependencies in a Packages.md file conforming to the obscure format that is currently used in the [scripts](../scripts).
