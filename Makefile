#SRC = src/*
NPM = `npm bin`

all: build

build:
	@env NODE_ENV=production $(NPM)/webpack ${ARGS}

serve:
	@$(NPM)/webpack-dev-server ${ARGS}

watch:
	@$(NPM)/webpack --watch ${ARGS}

.PHONY: all test clean doc build watch
