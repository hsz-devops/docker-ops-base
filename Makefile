# v2.4.0    2020-01-27     webmaster@highskillz.com

TAG_VERSION=200127a

THIS_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
TIMESTAMP=$(shell date -u +"%Y%m%d_%H%M%S%Z")

BUILD_CACHE=
#BUILD_CACHE=--no-cache --force-rm

default: build

include ./Makefile.base

# --------------------------------------------------------------------------
build: build-ubuntu

all: build-alpine build-ubuntu

#build-alpine: build-alpine-base build-alpine-provis
build-alpine: build-alpine-base
build-ubuntu: build-ubuntu-base

pull: pull-alpine pull-ubuntu
pull-alpine: pull-alpine-base
pull-ubuntu: pull-ubuntu-base

push: push-alpine push-ubuntu
push-alpine: push-alpine-base
push-ubuntu: push-ubuntu-base

# --------------------------------------------------------------------------
# clean-images:
# 	docker rmi $(DH_ID_base):alpine  $(DH_ID):alpine   || true
# 	docker rmi $(DH_ID_base):ubuntu  $(DH_ID):ubuntu   || true
#
# d-rmi: clean-images clean-junk

# --------------------------------------------------------------------------
list:
	docker images
	docker volume ls
	docker ps -a

# --------------------------------------------------------------------------
