#!/bin/sh

cd src
for FILE in *.md
do

        TARGETFILE="../html/${FILE%%.md}.html"
        pandoc --standalone --template fsfw-template.html ${FILE} -o $TARGETFILE
        
        # in the markdown docs there are markdown link targets (to play nicely with github)
        # now its time to convert them
        
        perl -p -i -e 's/\.md">/\.html">/g' $TARGETFILE
done
