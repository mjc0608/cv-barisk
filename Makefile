TEX=pdflatex
BIBTEX=bibtex
TARGET=cv
EXTENSIONS=aux toc idx ind ilg log lof lot lol bbl blg

CV=cv

all: ${CV}

${CV}: ${CV}.tex biblio-confs-journals.bib
	${TEX} ${CV}
	${BIBTEX} ${CV}1
	${TEX} ${CV}
	${TEX} ${CV}

clean:
	for EXT in ${EXTENSIONS}; \
	do \
	find `pwd` -name \*\.$${EXT} -exec rm -v \{\} \; ;\
	done
	rm -f ${TARGET}.dvi
	rm -f ${TARGET}.pdf
	rm -f ${TARGET}.ps
	rm -f ${TARGET}.out
	rm -f www/*\.*
	rm -f *~

