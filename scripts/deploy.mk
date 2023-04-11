# FOCUS Lab, University of Florida ECE
# Author: Yuxuan Zhang

TARGETS += deploy

# Populate JSON configuration for server
define SERVER_CONFIG_JSON:
{
	"port": 8080
}
endef
# 

deploy:
	@echo TODO

.PHONY: deploy
