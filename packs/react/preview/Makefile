OS := $(shell uname)

preview:
ifeq ($(OS),Darwin)
	sed -i "" -e "s/version:.*/version: $(PREVIEW_VERSION)/" Chart.yaml
	sed -i "" -e "s/version:.*/version: $(PREVIEW_VERSION)/" ../REPLACE_ME_APP_NAME/Chart.yaml
	sed -i "" -e "s/tag: .*/tag: $(PREVIEW_VERSION)/" values.yaml
else ifeq ($(OS),Linux)
	sed -i -e "s/version:.*/version: $(PREVIEW_VERSION)/" Chart.yaml
	sed -i -e "s/version:.*/version: $(PREVIEW_VERSION)/" ../REPLACE_ME_APP_NAME/Chart.yaml
	sed -i -e "s|repository: .*|repository: $(DOCKER_REGISTRY)\/REPLACE_ME_ORG\/REPLACE_ME_APP_NAME|" values.yaml
	sed -i -e "s/tag: .*/tag: $(PREVIEW_VERSION)/" values.yaml
else
	echo "platfrom $(OS) not supported to release from"
	exit -1
endif
	echo "  version: $(PREVIEW_VERSION)" >> requirements.yaml
	helm init --client-only
	cd ../REPLACE_ME_APP_NAME && make build && cd -
	jx step helm build
