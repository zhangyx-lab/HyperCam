# FOCUS Lab, University of Florida ECE
# Author: Yuxuan Zhang

deploy:
	@echo "Building WebUI"
	cd WebUI; npm run build;
	@echo "Linking static contents"
	ln -sfT $(PWD)/WebUI/var/dist $(PWD)/Server/var/web

.PHONY: deploy
