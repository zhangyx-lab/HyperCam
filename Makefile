# FOCUS Lab, University of Florida ECE
# Author: Yuxuan Zhang

TARGETS := submodules Server/var/config.json deploy systemd

install: all-targets

include scripts/*.mk

all-targets: $(TARGETS)

# Local directories
var tmp:
	@mkdir -p $@

clean:
	rm -rf var tmp

.PONY: install var tmp clean
