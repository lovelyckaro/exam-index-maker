# Exam cheat sheet maker

Make your own index of old exams with answers to search through.
Download the exams to be included into the exams folder and run
`make`

result will be in `merged.pdf`

## Ordering

The exams will be added in order by reverse file name.
That is if you have your exams named as the following:
+ 20200818.pdf
+ 20190812.pdf
+ 20200414.pdf

They will appear in the following order in merged.pdf
1. 20200818.pdf
2. 20200414.pdf
3. 20190812.pdf


## Dependencies
+ GHC
+ pdflatex