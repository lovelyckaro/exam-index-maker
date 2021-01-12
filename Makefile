generate_pdf: generate_latex
	@echo "Compiling pdf"
	pdflatex merged.tex

generate_latex: compile_haskell
	@echo "Generating latex"
	./generateLatex

compile_haskell:
	@echo "Compiling generateLatex.hs"
	ghc -O src/generateLatex.hs -o generateLatex

clean:
	@echo "Cleaning up!"
	rm generateLatex generateLatex.hi generateLatex.o merged.aux merged.tex merged.fdb_latexmk merged.fls merged.log merged.synctex.gz