BIN=$(shell git rev-parse --show-toplevel)/bin

.PHONY: test testfix virtualenv requirements

virtualenv:
	virtualenv venv

requirements: virtualenv
	venv/bin/pip install cram

test: venv/bin/pip
	BIN=$(BIN) venv/bin/cram tests/cram

testfix: venv/bin/pip
	BIN=$(BIN) venv/bin/cram -i tests/cram
