set TMP=tmp
set BIN="C:\Programme\MiKTeX 2.9\miktex\bin"

%BIN%\pdflatex -interaction=nonstopmode +--src-specials Thesis
%BIN%\makeindex Thesis.nlo -s nomencl.ist -o Thesis.nls
%BIN%\bibtex Thesis
%BIN%\bibtex web
%BIN%\pdflatex -interaction=nonstopmode --src-specials Thesis
%BIN%\pdflatex -interaction=nonstopmode --src-specials Thesis

