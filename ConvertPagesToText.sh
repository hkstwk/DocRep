#!/bin/bash

# output folder for unzipping the .pages file (really long name to avoid name conflicts)
FOLDER_NAME=$1.unzipped.for.git.diff.text.comparison

# exit if a file already exists with $FOLDER_NAME so we don't delete it later.. (but this is really unlikely)
mkdir $FOLDER_NAME || { echo 'mkdir failed.. $FOLDER_NAME already exists' ; exit 1; }

# unzip the .pages file into the folder
unzip -qq -o $1 -d $FOLDER_NAME

# convert to text and print the text to stdout
xsltproc Pages.xsl $FOLDER_NAME/index.xml

# clean up our work
rm -rf $FOLDER_NAME
