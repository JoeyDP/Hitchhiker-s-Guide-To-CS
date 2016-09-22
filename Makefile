MAINTEXFILES       = $(basename $(shell find ./*/git/ -name 'main.tex'))
MAINPDFFILES			 = $(addsuffix .pdf,$(MAINTEXFILES))
MAINNOTESTEXFILES  = $(basename $(shell find ./*/git/ -name 'mainNotes.tex'))
MAINNOTESPDFFILES	 = $(addsuffix .pdf,$(MAINNOTESTEXFILES))

CRAPEXTENSIONS     = .*\.\(aux\|log\|nav\|out\|snm\|toc\)

.PHONY: all
all: main mainNotes cleanCrap

.PHONY: main
main: $(MAINPDFFILES)

.PHONY: mainNotes
mainNotes: $(MAINNOTESPDFFILES)


%.pdf: %.tex
	cd $(dir $^) && git pull && pdflatex $(notdir $^) > /dev/null
	cp $@ "$(dir $@)../$(notdir $@)"

.PHONY: cleanCrap
cleanCrap:
	find ./*/git/ -regex "$(CRAPEXTENSIONS)" -delete

.PHONY: clean
clean: cleanCrap
	find ./*/ -name "main.pdf" -delete
	find ./*/ -name "mainNotes.pdf" -delete
