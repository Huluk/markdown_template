outfile = report.pdf
infiles = report.md

# bib = --bibliography=bibliography.bib

# opts += --number-sections
# opts += --table-of-contents # -V toc-depth=2
# opts += -A appendix.tex
# opts += -V geometry:top=2.5cm # need more space

lang = en-GB
docclass = article
paging = oneside
size = 11pt
linestretch = 1.04

pandoc:
	pandoc -H header.tex $(bib) \
		-V documentclass=$(docclass) -V classoption=$(paging) \
		-r markdown+tex_math_double_backslash \
		--smart --normalize $(opts) \
		-V hidelinks -V linkcolor=black -V urlcolor=black \
		-V linestretch=$(linestretch) \
		-V papersize=A4 -V fontsize=$(size) \
		-V language=$(lang) \
		-o $(outfile) \
		$(infiles)
