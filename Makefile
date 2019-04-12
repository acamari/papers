src!=echo *.tex
dst=${src:%.tex=%.pdf}
#srcdot!=echo img/*.dot
#dstdot=${srcdot:%.dot=%.pdf}
LATEX=xelatex
LATEXFLAGS=-output-dir=${BUILD} -interaction=nonstopmode -halt-on-error
BUILD=build
dirs=${BUILD}

.SUFFIXES: .tex .pdf .dot

build: dirs ${dst} ${dstdot} 

.tex.pdf: 
	${LATEX} ${LATEXFLAGS} $< && mv ${BUILD}/$@ $@

.dot.pdf: 
	dot -Tpdf $< > $@

dirs: 
	mkdir -p ${BUILD}

clean:
	rm ${dst} ${dstdot}

.PHONY: dirs
