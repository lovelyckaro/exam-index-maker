# For directory in tmp (set of exam + solutions)
for d in tmp/*/ ; do
    tmp=${d%%/}
    texname=${tmp##*/}i.tex # filename for output tex file
    pdfname=${tmp##*/}i.pdf # filename for output pdf file
    ./generateLatex $d $texname # generateLatex for combining the files
    latexmk -pdf -silent -outdir=trash $texname > /dev/null # Compile the latex into a pdf
    rm $texname # remove the generated latex file
    mv trash/$pdfname exams/ # Move the pdf file to exams/
    rm -rf trash # Remove aux latex files
done