#!/bin/sh



# convert a single file 
#pandoc --standalone --template fsfw-template.html content.md -o output.html


# convert all markdown files at once

ORIGPATH=`pwd`

cd ../src/

for f in *.md ;
do
cmd="pandoc --standalone --template $ORIGPATH/fsfw-template.html ${f} -o ../html/${f%%.md}.html"

# for debugging:
# echo $cmd
eval $cmd
done


cd $ORIGPATH