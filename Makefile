.PHONY: all
all: output
output: tutorial
	python tools/sphinx-build.py . tutorial
