.PHONY: build-image
build-image:
	docker build . -t mlir-df:v1

.PHONY: run-image
run-image:
	docker run -it --rm -v $(PWD):/home/polyarch/mlir-df/ mlir-df:v1

.PHONY: stop-all-containers
stop-all-containers:
	-docker stop $(docker ps -a -q)
	-docker rm $(docker ps -a -q)
