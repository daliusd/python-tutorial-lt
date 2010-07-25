.PHONY: all
all: html
html: tutorial vertimas.rst
	python tools/sphinx-build.py -b html . html
