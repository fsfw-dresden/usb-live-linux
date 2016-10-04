#!/bin/sh



# convert a single file 
#pandoc --standalone --template fsfw-template.html content.md -o output.html


# convert all markdown files at once

ORIGPATH=`pwd`

cd ../src/

for f in *.md ;
do

TARGETFILE="../html/${f%%.md}.html"

cmd="pandoc --standalone --template $ORIGPATH/fsfw-template.html ${f} -o $TARGETFILE"

# for debugging:
# echo $cmd
eval $cmd


# in the markdown docs there are markdown link targets (to play nicely with github)
# now its time to convert them

perl -p -i -e 's/\.md">/\.html">/g' $TARGETFILE
done


cd $ORIGPATH