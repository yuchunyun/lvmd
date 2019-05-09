REGISTRY_NAME = zdnscloud/lvmd
IMAGE_VERSION = v0.2

.PHONY: all container

all: container

container:
	docker build -t ${REGISTRY_NAME}:${IMAGE_VERSION} .
