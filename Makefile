merged.pdf: merged.tex
	@echo "Compiling pdf"
	latexmk -pdf -outdir=trash -silent merged.tex
	mv trash/merged.pdf ./
	clean

merged.tex: generateLatex
	@echo "Generating latex"
	./generateLatex

generateLatex:
	@echo "Compiling generateLatex.hs"
	ghc -O src/generateLatex.hs -o generateLatex

download: generateLatex
	@echo "Downloading files"
	sh download.sh $(URL)
	@echo "Combining seperate exams and solutions into one file"
	sh combine.sh
	rm -rf tmp/*/

clean:
	@echo "Cleaning up"
	rm -rf trash
	rm merged.tex
	rm generateLatex
	rm src/generateLatex.hi
	rm src/generateLatex.o

clean-downloads:
	@echo "Removing downloads"
	rm exams/*.pdf