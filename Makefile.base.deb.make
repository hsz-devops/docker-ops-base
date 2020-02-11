# v2.6.0    2020-01-26     webmaster@highskillz.com

# .ONESHELL:
.SHELLFLAGS = -e
# --------------------------------------------------------------------------
build-base: build-base-deb

build-base-deb: build-base-deb10-ans29-py37

build-base-deb10-ans29-py37:    r--build-base-deb10-ans29-py37
	docker tag ez123/ops-base:deb10-ans29-py37 ez123/ops-base:deb10-ans29

# --------------------------------------------------------------------------
pull-base: pull-base-deb

pull-base-deb: check-env-base r--pull-base-deb10-ans29-py37

# --------------------------------------------------------------------------
push-base: push-base-deb

push-base-deb: check-env-base r--push-base-deb10-ans29-py37

# --------------------------------------------------------------------------
shell-deb:                        shell-base-deb10-ans29-py37

shell-base-deb10-ans29-py37:     r--shell-base-deb10-ans29-py37

# --------------------------------------------------------------------------
# TEST_TAG=-181112c

# --------------------------------------------------------------------------# --------------------------------------------------------------------------
test-deb:                        test-base-deb
test-base-deb:                   test-base-deb10-ans29-py37
test-base-deb10-ans29-py37:     r--test-base-deb10-ans29-py37$(TEST_TAG)