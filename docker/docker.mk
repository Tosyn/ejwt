###Docker targets

DOCKER_IMAGE = ejwt
DOCKER_CONTAINER_NAME = ejwt
DOCKER_BUILT = docker/.Dockerfile.built

dbuild:
	@docker build -f docker/Dockerfile -t $(DOCKER_IMAGE) docker/ && touch $(DOCKER_BUILT)

dcibuild: dbuild
	@docker/run $(DOCKER_IMAGE) $(DOCKER_CONTAINER_NAME) "./script/run_test" true

dtest: dbuild
	@docker/run $(DOCKER_IMAGE) $(DOCKER_CONTAINER_NAME) "./script/run_test" true

drun: dbuild
	@docker/run $(DOCKER_IMAGE) $(DOCKER_CONTAINER_NAME) "make start" true -t

dbash: dbuild
	@docker/run $(DOCKER_IMAGE) $(DOCKER_CONTAINER_NAME) "/bin/bash" true -t

dclean: dbuild
	@docker/run $(DOCKER_IMAGE) $(DOCKER_CONTAINER_NAME) "make clean" true

dmake: dbuild
	@docker/run $(DOCKER_IMAGE) $(DOCKER_CONTAINER_NAME) "make" false

ddockerclean:
	@rm -f $(DOCKER_BUILT)
