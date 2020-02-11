# v2.6.0    2020-01-26     webmaster@highskillz.com

# .ONESHELL:
.SHELLFLAGS = -e

DH_ID_base=ez123/ops-base

# --------------------------------------------------------------------------
dc-list-ours:
	@docker images --filter=reference="${DH_ID_base}*:*" |grep -vE "\-2[0-9]+[a-zA-Z]?" |grep -v "none" |sort -V -r
	@docker images --filter=reference="${DH_ID_base}*:*" |grep -vE "\-2[0-9]+[a-zA-Z]?" |grep -v "none" |wc -l

	@docker images --filter=reference="${DH_ID_base}*:*-*" |grep -E "\-2[0-9]+[a-zA-Z]?" |grep -v "${TAG_VERSION}" |sort -V -r
	@docker images --filter=reference="${DH_ID_base}*:*-*" |grep -E "\-2[0-9]+[a-zA-Z]?" |grep -v "${TAG_VERSION}" |wc -l

	@docker images --filter=reference="${DH_ID_base}*:*-${TAG_VERSION}" |sort -V -r
	@docker images --filter=reference="${DH_ID_base}*:*-${TAG_VERSION}" |wc -l
	@docker images --filter=reference="${DH_ID_base}*:*"                |wc -l

# --------------------------------------------------------------------------
dc-clean-ours-only:
	docker images --filter=reference="${DH_ID_base}*:*"
	docker rm  $$(docker ps -a -q)                                           ||true
	docker rmi -f $$(docker images -q -f dangling=true)                      ||true
	# docker rmi -f $$(docker images -q --filter=reference="$(DH_ID_base)*:*") ||true

# --------------------------------------------------------------------------
check-env-base:
	test -n "$(TAG_VERSION)"   # TAG_VERSION.base
	test -n "$(TIMESTAMP)"     # TIMESTAMP.base

# --------------------------------------------------------------------------
include ./Makefile.base.alpine.make
include ./Makefile.base.ubuntu.make
include ./Makefile.base.deb.make