merged.pdf: merged.tex
	@echo "Compiling pdf"
	pdflatex merged.tex

merged.tex: generateLatex
	@echo "Generating latex"
	./generateLatex

generateLatex:
	@echo "Compiling generateLatex.hs"
	ghc -O src/generateLatex.hs -o generateLatex

clean:
	@echo "Cleaning up!"
	rm generateLatex merged.aux merged.tex merged.log