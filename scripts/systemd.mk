# FOCUS Lab, University of Florida ECE
# Author: Yuxuan Zhang

# Configurable parameters
SERVICE_NAME        ?= HyperCam.service
SERVER_NAME         ?= HyperCam Server
SERVER_HOME         ?= $(PWD)/Server
RESTART_BURST_INTVL ?= 300
RESTART_BURST_LIMIT ?= 5
$(info $(shell env which node))
# Service Configuration Content
define SERVICE_CONFIG
[Unit]
Description=HyperCam Server
After=network.target
StartLimitIntervalSec=$(RESTART_BURST_LIMIT)
StartLimitBurst=$(RESTART_BURST_LIMIT)

[Service]
Type=simple
User=$(USER)
ExecStart=$(shell which node) $(SERVER_HOME)
WorkingDirectory=$(SERVER_HOME)
Restart=always
RestartSec=1

[Install]
WantedBy=multi-user.target
endef
export SERVICE_CONFIG

# Save configuration to local file
var/$(SERVICE_NAME): var
	@echo "$$SERVICE_CONFIG" > $@

systemd: var/$(SERVICE_NAME) stop
	@echo "Linking service configuration"
	$(eval SERVICE_FILE:=$(PWD)/$<)
	sudo systemctl link "$(SERVICE_FILE)"
	@echo "Enabling $(SERVICE_NAME)"
	sudo systemctl daemon-reload
	sudo systemctl enable $(SERVICE_NAME)
	sudo systemctl start $(SERVICE_NAME)

status:
	-systemctl status $(SERVICE_NAME)

stop:
	-sudo systemctl stop $(SERVICE_NAME)

.PRECIOUS: var/server.service
.PHONY: systemd status stop var/$(SERVICE_NAME)
