src = $(wildcard *.tex)
pdf = $(src:.tex=.pdf)
imgpdf = $(wildcard img/*.pdf)

.PHONY: all clean install

all: $(pdf) $(imgpdf)

%.pdf: %.tex $(wildcard src/*.tex) $(wildcard *.bib) $(imgpdf)
	latexmk -file-line-error -synctex=1 -halt-on-error -pdf $<

fast:
	# enforce tex execution
	pdflatex -synctex=1 $(src)

clean:
	latexmk -C $(src)
	rm -f $(wildcard *.out *.nls *.nlo *.bbl *.blg *-blx.bib *.run.xml *.bcf *.synctex.gz *.fdb_latexmk *.fls *.toc)
	rm -f $(wildcard src/*.aux)
