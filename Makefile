merged.pdf: merged.tex
	@echo "Making merged.pdf"
	@latexmk -pdf -outdir=trash -silent merged.tex > /dev/null
	@mv trash/merged.pdf ./

merged.tex: generateLatex exams/*.pdf src/start.tex src/end.tex
	@echo "Making merged.tex"
	@./generateLatex exams/ merged.tex

generateLatex: src/generateLatex.hs
	@echo "Compiling generateLatex.hs"
	@ghc -O src/generateLatex.hs -o generateLatex

download: generateLatex src/download.sh src/combine.sh
	@echo "Downloading files"
	@sh src/download.sh $(URL)
	@echo "Combining seperate exams and solutions into one file"
	@sh src/combine.sh
	@rm -rf tmp/*/

clean:
	@echo "Cleaning up"
	@rm -rf trash
	@rm merged.tex
	@rm generateLatex
	@rm src/generateLatex.hi
	@rm src/generateLatex.o

clean-downloads:
	@echo "Removing downloads"
	@rm exams/*.pdf