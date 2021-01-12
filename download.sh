base="https://chalmerstenta.se"
end="/test"

paths=$( curl $1 | pup "td a attr{href}")

echo "Downloading exams"
for path in $paths
do
    if [[ $path == /tenta/* ]]
    then
        if [[ $path == *i.pdf ]]
        then
            cd exams
           # curl -O -J -# $base$path
            cd ../ 
        else
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