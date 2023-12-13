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

.PHONY: docs
