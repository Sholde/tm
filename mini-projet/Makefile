OUT = rapport.pdf
SRC = src

.PHONY: all half-clean clean

all: $(OUT) main half-clean

$(OUT): rapport.tex img/*
	pdflatex $< -o $@

main: $(SRC)/main.f90
	gfortran $< -o $@

half-clean:
	rm -Rf *~ *.log *.aux *.toc

clean:
	rm -Rf *~ *.log *.aux *.toc *.o main

