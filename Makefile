
PODSPEC=RFModule.podspec

# VERSION_STRING=$(shell git describe --abbrev=0 --tags)
VERSION_STRING=$(shell cat VERSION)
GIT_ORIGIN=$(shell git remote get-url --all origin)
GIT_OPENSOURCE=$(shell git remote get-url --all opensource)

define replace
	@sed -i '' 's@$(1)@$(2)@g' $(3)
endef

define prepare_publish
	$(call replace,`make get_source`,"$(2)",$(3))
	$(call replace,`make get_version`,"$(1)",$(3))
endef

define finalize_publish
	$(call replace,"$(2)",`make get_source`,$(3))
	$(call replace,"$(1)",`make get_version`,$(3))
endef

test:
	@echo "this is value $(REMOTE)"

lint:
	pod lib lint --sources="$(PODSOURCES)"

pod_install:
	pod install --project-directory="Example"

publish:
	$(eval ARG := $(filter-out $@,$(MAKECMDGOALS)))
	$(eval ARG := $(or $(strip $(ARG)), "origin"))
	$(eval REMOTE := $(if $(findstring "opensource", "$(ARG)"), $(GIT_OPENSOURCE), $(GIT_ORIGIN)))
	$(call prepare_publish,$(VERSION_STRING),$(REMOTE),$(PODSPEC))
	pod repo push $(PODREPO) $(PODSPEC) || $(call finalize_publish,$(VERSION_STRING),$(REMOTE),$(PODSPEC))
	$(call finalize_publish,$(VERSION_STRING),$(REMOTE),$(PODSPEC))

set_version:
	$(eval NEW_VERSION_AND_NAME := $(filter-out $@,$(MAKECMDGOALS)))
	$(eval NEW_VERSION := $(shell echo $(NEW_VERSION_AND_NAME) | sed 's/[^0-9\.]*//g' ))
	echo $(NEW_VERSION) > VERSION

get_source:
	@echo $(GIT_ORIGIN)

get_version:
	@echo $(VERSION_STRING)

push_version:
ifneq ($(strip $(shell git status --untracked-files=no --porcelain 2>/dev/null)),)
	$(error git state is not clean)
endif
	git commit -a -m "release $(VERSION_STRING)"
	git tag -a $(VERSION_STRING) -m "$(VERSION_STRING)"
	git push origin master
	git push origin $(VERSION_STRING)

%:
	@:
