GIT_SHA    = $$(git rev-parse --short HEAD)

install:
	bin/install.sh

build:
	@read -p "Enter Docker Repo:" REPO; \
	echo "$$REPO/mopice-$(GIT_SHA)"; \
	docker build -t $$REPO/mopice:$(GIT_SHA) .; \
	docker push $$REPO/mopice:$(GIT_SHA);

tag:
	@read -p "Enter Docker Repo:" REPO; \
	read -p "Enter Version Tag:" TAG; \
	echo "$$REPO/mopice-$$TAG"; \
	echo "$$REPO/mopice-$(GIT_SHA)"; \
	docker tag $$REPO/mopice:$(GIT_SHA) $$REPO/mopice:$$TAG; \
	docker push $$REPO/mopice:$$TAG;
