deploy:
	ansible-playbook --inventory hosts --ask-become-pass pcs.yaml
