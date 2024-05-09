TAG        := $(shell git describe --tags --long --abbrev=8 --dirty)
SHELL      := /bin/bash
ROOT_DIR   := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
REGISTRY   := ghcr.io/sbostick
APP_NAME   := dev-env-public
IMAGE      := ${REGISTRY}/${APP_NAME}:${TAG}
BUILD_TIME := $(shell date "+%F %H:%M:%S %Z (%z)")

LAST_KNOWN_GOOD := None

tag:
	@echo "${TAG}"

release-tag:
	@echo git tag -a v0.0.1 -m 'description'
	@echo git push origin --tags

lint:
	shellcheck ./templates/macos/zshrc
	shellcheck ./templates/macos/bashrc

install:
	./scripts/INSTALL.sh

# https://github.com/junegunn/vim-plug
refresh-vim-plug:
	@curl -flo templates/dotvim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
