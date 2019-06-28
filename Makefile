src!=echo *.tex
dst=${src:%.tex=%.pdf}
srcdot!=find img -name '*.dot' | tee /dev/stderr
dstdot=${srcdot:%.dot=%.pdf}
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

pronodebsd.pdf: img/pronodebsd/arq.pdf img/pronodebsd/arq-2.pdf
.PHONY: dirs
