# List of subfolders
DIR1 = Module1-Intro-and-Describing-Data 
DIR2 = Module3-Random-Variables 
DIR3 = Module4-Sampling-and-Estimation 
DIR4 = Module5-Linear-Regression
DIR5 = All-Notes

SUBDIRS = $(DIR1) $(DIR2) $(DIR3) $(DIR4) $(DIR5)
#SUBDIRS = $(DIR5)

# Compile allfiles
all: compile 

# Rule to compile PDFs in each subfolder
compile:
	for dir in $(SUBDIRS); do \
		(cd $$dir && for file in *.tex; do \
			pdflatex $$file; \
			pdflatex $$file; \
			rm -f $${file%.tex}.aux $${file%.tex}.toc $${file%.tex}.log $${file%.tex}.out; \
		done); \
	done
