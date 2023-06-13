build:
	shards build

release:
	shards build --release

install:
	shards build --release
	cp ./bin/taskwarrior-scrum ~/.local/bin/taskwarrior-scrum

.PHONY: build
