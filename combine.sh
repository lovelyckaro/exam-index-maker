for d in tmp/*/ ; do
    tmp=${d%%/}
    texname=${tmp##*/}i.tex
    pdfname=${tmp##*/}i.pdf
    ./generateLatex $d $texname
    latexmk -pdf -silent -outdir=trash $texname
    rm $texname
    mv trash/$pdfname exams/
    rm -rf trash
done