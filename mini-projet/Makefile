OUT = rapport.pdf

.PHONY: all half-clean clean

all: $(OUT) main half-clean

$(OUT): rapport.tex
	pdflatex $< -o $@

main: main.f90
	gfortran $< -o $@

half-clean:
	rm -Rf *~ *.log *.aux *.toc

clean:
	rm -Rf *~ *.log *.aux *.toc *.o main

