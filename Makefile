#SRC = src/*
NPM = `npm bin`

all: build

build:
	@env NODE_ENV=production $(NPM)/webpack ${ARGS}

serve:
	@#$(NPM)/webpack-dev-server ${ARGS}
	@$(NPM)/coffee server.coffee ${ARGS}

watch:
	@$(NPM)/webpack --watch ${ARGS}

clean:
	@rm -rf dist ../web/static

web:
	@rm -rf ../web/static
	@cp -R dist/* ../web

.PHONY: all test clean doc build watch
