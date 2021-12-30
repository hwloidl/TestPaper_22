#!/bin/sh

pdflatex -interaction=nonstopmode --src-specials Thesis
makeindex Thesis.nlo -s nomencl.ist -o Thesis.nls
bibtex Thesis
#bibtex web
pdflatex -interaction=nonstopmode --src-specials Thesis
pdflatex -interaction=nonstopmode --src-specials Thesis
