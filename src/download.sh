base="https://chalmerstenta.se"
end="/test"

# Paths are all links inside a td element on the requested page
paths=$( curl -# $1 | pup "td a attr{href}")
for path in $paths
do
    if [[ $path == /tenta/* ]] # If the path begins with /tenta/ we want it
    then
        if [[ $path == *i.pdf ]] # If path ends with i.pdf the solutions and exam are in the same pdf
        then # Download into exams directly
            cd exams
            curl -O -J -# $base$path
            cd ../
        elif [[ $path == *x.pdf ]] # If solutions are missing, ignore the file
        then
            echo $path is missing solutions, skipping
        else # Otherwise we need to download the exam and solution pdfs separately and combine later
            cd tmp
            fn=${path##*/}
            dn=${fn%?.pdf}
            mkdir -p $dn
            cd $dn
                curl -O -J -# $base$path
            cd ..
            cd ..
        fi
    fi

done