OUT = rapport.pdf

.PHONY: all clean

all: $(OUT) clean

$(OUT): rapport.tex
	pdflatex $< -o $@

clean:
	rm -Rf *~ *.log *.aux *.toc

