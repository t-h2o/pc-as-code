INDEX	=	docs/index.html
README	=	README.adoc

deploy:
	ansible-playbook --inventory hosts --ask-become-pass pcs.yaml

$(INDEX): $(README)
	asciidoctor $(README) -o $(INDEX) \
		--attribute nofooter \
		--attribute toc=left \
		--attribute sectnums

docs: $(INDEX)

lint-yaml:
	yamllint .

lint-ansible:
	ansible-lint roles

lint: lint-yaml lint-ansible

.PHONY: docs
