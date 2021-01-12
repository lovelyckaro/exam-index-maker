merged.pdf: merged.tex
	@echo "Compiling pdf"
	latexmk -pdf merged.tex
	latexmk -c

merged.tex: generateLatex
	@echo "Generating latex"
	./generateLatex

generateLatex:
	@echo "Compiling generateLatex.hs"
	ghc -O src/generateLatex.hs -o generateLatex