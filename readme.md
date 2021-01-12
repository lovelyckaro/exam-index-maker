# Exam cheat sheet maker

Make your own index of old exams with answers to search through.
Download the exams to be included into the exams folder and run
`make`

result will be in `merged.pdf`

## Downloading
To download exams, and automatically merge separate exams and solutions from chalmerstenta.se use:
```
make download URL={your url here}
```
For example use the following for Transforms Signals and Systems:
```
make download URL="https://chalmerstenta.se/?kurs=Transformer_signaler_och_system"
```

## Cleaning up afterwards

`make clean` will remove all the shit latex generates when building.

`make clean-downloads` will remove the pdfs in `exams/`.
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
+ pup
+ make