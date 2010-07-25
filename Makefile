.PHONY: all
all: html
html: tutorial
	python tools/sphinx-build.py -b html . html
