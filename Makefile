GIT_SHA = $$(git rev-parse --short HEAD)
REPO    = ssjoleary

install:
	bin/install.sh

build:
	echo "$(REPO)/mopice-$(GIT_SHA)"; \
	docker build -t $(REPO)/mopice:$(GIT_SHA) .; \
	docker push $(REPO)/mopice:$(GIT_SHA);

tag:
	@read -p "Enter Version Tag:" TAG; \
	echo "$(REPO)/mopice-$$TAG"; \
	echo "$(REPO)/mopice-$(GIT_SHA)"; \
	docker tag $(REPO)/mopice:$(GIT_SHA) $(REPO)/mopice:$$TAG; \
	docker push $(REPO)/mopice:$$TAG;
