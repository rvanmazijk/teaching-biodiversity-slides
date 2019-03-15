SLIDES_RMD = RvanMazijk_biodiversity-evolution-and-taxonomy_slides.Rmd
SLIDES_PDF = $(SLIDES_RMD:.Rmd=.pdf)

RENDER = Rscript -e "\
	library(rmarkdown);\
	render('$<', 'beamer_presentation')"

all: slides

slides: $(SLIDES_PDF)

$(SLIDES_PDF): $(SLIDES_RMD) _output.yml style.sty
	$(RENDER)
