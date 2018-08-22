.DEFAULT: buildctl

buildctl:
	@echo "$@"
	buildctl build --frontend=dockerfile.v0 --local context=. --local dockerfile=. --exporter=docker --exporter-opt name=buildkit-umask-repro | docker load
	docker run --rm -it buildkit-umask-repro ls -la /scripts
	docker run --rm -it buildkit-umask-repro setuidgid newuser /scripts/echo.sh

docker:
	@echo "$@"
	docker build -t buildkit-umask-repro .
	docker run --rm -it buildkit-umask-repro ls -la /scripts
	docker run --rm -it buildkit-umask-repro setuidgid newuser /scripts/echo.sh
