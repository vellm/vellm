#!/bin/bash
set -x

FILE_COMMAND=vellm
FORMULA_REPO=github.com:vellm/homebrew-vellm.git
FORMULA_PATH=homebrew-vellm/
FORMULA_FILE=Formula/$FILE_COMMAND.rb
FORMULA_BINARY=dist/vellm_darwin_amd64.zip

CHECKSUM=$(cat $FORMULA_BINARY | shasum -a256 | awk '{print $1}')

git clone git@$FORMULA_REPO ./$FORMULA_PATH

cd $FORMULA_PATH

sed -e "s/version \"[0-9.]*\"/version \"$CIRCLE_TAG\"/g" \
    -e "s/sha256 \"[a-zA-Z0-9]*\"/sha256 \"$CHECKSUM\"/g" \
    $FORMULA_FILE > $FORMULA_FILE.new
rm $FORMULA_FILE
mv $FORMULA_FILE.new $FORMULA_FILE

git add $FORMULA_FILE
git commit -m "Release $FILE_COMMAND $CIRCLE_TAG"
git push origin master
