VIEWER	=	@gnome-open
LATEX	=	@pdflatex
OUT		=	andrade_icassp2015
IN		=	andrade_icassp2015
FMT		=	pdf
ARGS	=	-shell-escape -enable-write18 -synctex=1 -interaction=nonstopmode

.build: $(IN).tex
	$(LATEX) $(ARGS) $(IN).tex
	@bibtex $(IN)
	$(LATEX) $(ARGS) $(IN).tex
	$(LATEX) $(ARGS) $(IN).tex

.cleanup:
	@rm -rf *.acn *.acr *.alg *.aux *.bbl *.blg *.glg *.glo *.gls *.ist *.lof *.lot *.out *.synctex.gz* *.toc *.log

.view: $(OUT).pdf
	$(VIEWER) $(OUT).pdf &

all: .build .cleanup .view

clean: .cleanup

view: .view
