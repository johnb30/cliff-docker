HOST_INDEX_LOCATION := /etc/cliff2/IndexDirectory
CLIFF_VERSION := 2.3.0
CLIFF_PORT := 8080

.PHONY: default
default: description

description:
	@echo "Available commands:"
	@echo "  * buildindex"
	@echo "  * buildserver"
	@echo "  * run"

.PHONY: buildindex
buildindex:
	docker build -t cliff_index -f ./Dockerfile.index .
	docker run -t cliff_index /bin/true
	docker cp `docker ps -q -n=1`:/CLAVIN/IndexDirectory $(HOST_INDEX_LOCATION)

.PHONY: buildserver
buildserver:
	docker build --build-arg CLIFF_VERSION=$(CLIFF_VERSION) -t cliff:$(CLIFF_VERSION) -f ./Dockerfile.server .

.PHONY: run
run:
	docker run -d -p $(CLIFF_PORT):8080 -v $(HOST_INDEX_LOCATION):/etc/cliff2/IndexDirectory cliff:$(CLIFF_VERSION)
