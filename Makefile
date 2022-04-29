current_dir = $(shell pwd)

build:
	@ docker build -t ruby-schema-registry-cli-tools .

cli:
	@ docker run --rm --network=host -v $(current_dir)/schemas:/schemas --env-file $(current_dir)/configs.env -it ruby-schema-registry-cli-tools /bin/bash