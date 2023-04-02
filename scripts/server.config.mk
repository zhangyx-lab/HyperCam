# FOCUS Lab, University of Florida ECE
# Author: Yuxuan Zhang

PORT ?= 8080
PYTHON ?= $(shell which python3)
DRIVER_MAIN ?= $(PWD)/UVC_Driver/main.py

define SERVER_CONFIG
{
    "driver": "$(PYTHON)",
    "driverArgs": ["-u", "$(DRIVER_MAIN)"],
    "port": $(PORT)
}
endef
export SERVER_CONFIG

Server/var/config.json:
	@mkdir -p $(shell dirname $@)
	@echo "Creating server configuration"
	@echo "$$SERVER_CONFIG" > $@

.PHONY: Server/var/config.json
