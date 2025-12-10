#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t' # Strict Internal Field Separator

if [[ -f "out.pdf" ]]; then
  rm out.pdf
fi

# Erstellen der Zusammenfassung
echo " " > summary.tex
for mainfile in main*.tex; do
    #echo $mainfile
    class=${mainfile%.*}
    class=${class##main-}
    echo "\\section{$class}" >> summary.tex
    for logocolor in logocolor-*; do
        #echo $logocolor
        color=${logocolor%.*}
        color=${color##logocolor-}
        echo $color
        for logolang in logolang-*; do
            lang=${logolang%.*}
            lang=${lang##logolang-}
            #echo $logolang
            for usemargin in margin-*.tex; do
                margin=${usemargin%.*}
                margin=${margin##margin-}

                echo "\\subtitle{Mit Optionen Logofarbe $color, Logosprache $lang und Marginalie $margin}" > tempsubtitle.log

                cat $mainfile $logocolor $logolang $usemargin tempsubtitle.log "content-$class.tex" > tempmain.tex

                pdflatex "-jobname=main-$class-$color-$lang-$margin" tempmain.tex
                pdflatex "-jobname=main-$class-$color-$lang-$margin" tempmain.tex

                pages=$(qpdf main-$class-$color-$lang-$margin.pdf --show-npages)

                echo "\\includepdf[pages=-,link=true,addtotoc={1,subsection,2,$class $color $lang $margin,subsec:$class$color$lang$margin}]{main-$class-$color-$lang-$margin.pdf}" >> summary.tex
            done
        done
    done
done

pdflatex -jobname=out pdfpagecollector.tex
pdflatex -jobname=out pdfpagecollector.tex
pdflatex -jobname=out pdfpagecollector.tex

rm summary.tex
rm tempmain.tex
#qpdf --empty --pages *.pdf -- out.pdf
mv out.pdf ../out.pdf
rm *.pdf
rm *.log
rm *.aux
mv ../out.pdf out.pdf