# Mark all targets as being not a file
.PHONY: iso dist-image stick-install

iso:
	scripts/build-live-system.sh

dist-image:
	scripts/create-distribution-image.sh

stick-install:
	scripts/stick-install.sh
