########################################################################
## Modelo LaTeX NAO OFICIAL para trabalhos academicos da UFERSA,      ##
## mantido por Enthony Araujo.                                        ##
##                                                                    ##
## Versao modificada do modelo da UFC, que por sua vez foi adaptado   ##
## do ueceTeX2 (Thiago Nascimento, https://github.com/thiagodnf/uecetex2),
## customizacao do abnTeX2 (https://www.abntex.net.br/).              ##
##                                                                    ##
## This work may be distributed and/or modified under the             ##
## conditions of the LaTeX Project Public License, either version 1.3 ##
## of this license or (at your option) any later version.             ##
## The latest version of this license is in                           ##
##   http://www.latex-project.org/lppl.txt                            ##
## and version 1.3 or later is part of all distributions of LaTeX     ##
## version 2005/12/01 or later.                                       ##
########################################################################

filename=documento
LATEX=pdflatex -interaction=nonstopmode -halt-on-error

all: compile

compile:
	@echo "Compilando..."
	$(LATEX) $(filename).tex
	bibtex $(filename)
	makeglossaries $(filename)
	makeindex $(filename)
	$(LATEX) $(filename).tex
	$(LATEX) $(filename).tex
	@echo "Processo finalizado com sucesso!"

clean:
	@echo "Limpando arquivos auxiliares..."
	@rm -f *.out *.aux *.alg *.acr *.dvi *.gls *.log *.bbl *.blg *.ntn *.not *.lof *.lot *.toc *.loa *.lsg *.nlo *.nls *.ilg *.ind *.ist *.glg *.glo *.xdy *.acn *.idx *.loq *.lol *.lom *.lgr *.brf *.synctex.gz *.fls *.fdb_latexmk *~
	@rm -f $(filename).pdf
	@echo "Processo finalizado com sucesso!"

.PHONY: all compile clean
