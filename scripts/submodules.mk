# FOCUS Lab, University of Florida ECE
# Author: Yuxuan Zhang

# Conditional command to initialize PIP packages for Python projects
PIP_DEP ?= requirments.txt
PIP_INS ?= python3 -m pip install -r $(PIP_DEP) 2>&1 | cat
PIP_CMD := if test -f $(PIP_DEP); then $(PIP_INS); fi

# Conditional command to initialize NPM packages for NodeJS projects
NPM_DEP ?= package.json
NPM_INS ?= npm install 2>&1 | cat
NPM_CMD := if test -f $(NPM_DEP); then $(NPM_INS); fi

submodules:
	@-git submodule update --init --recursive --remote
	@-git submodule foreach "$(PIP_CMD); $(NPM_CMD)"

.PHONY: submodules
