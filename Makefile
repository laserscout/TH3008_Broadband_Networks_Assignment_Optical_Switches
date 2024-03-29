UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Linux)
	PDFVIEW = ""
endif

ifeq ($(UNAME_S),Darwin)
	PDFVIEW = "" ; skimview $@
endif

.PHONY: main.pdf all clean

all: main.pdf

FLAGS = -pdf -pdflatex="xelatex" -use-make \
	 -bibtex -synctex=1

main.pdf: main.tex
	latexmk $(FLAGS) main.tex $(PDFVIEW)

clean:
	latexmk -CA
	rm *.bbl
