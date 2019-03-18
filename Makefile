SLIDES_RMD = RvanMazijk_biodiversity-evolution-and-taxonomy_slides.Rmd
SLIDES_PDF = $(SLIDES_RMD:.Rmd=.pdf)
TREES_R = $(wildcard trees/*.nwk)
TREES_PNG = $(TREES_R:.nwk=.png)

RENDER = Rscript -e "\
	library(rmarkdown);\
	render('$<', 'beamer_presentation')"

all: slides

slides: $(SLIDES_PDF)

$(SLIDES_PDF): $(SLIDES_RMD) _output.yml style.sty images $(TREES_PNG)
	$(RENDER)

$(TREES_PNG): $(TREES_R)
	Rscript plot-trees.R
