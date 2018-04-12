#!/bin/bash
mkdir _BASE
shopt -s extglob
mv !(_BASE|_PREPARE.sh|MISSING_PHRASES.md) _BASE

for color in "black" "black-light" "blue" "blue-light" "green" "green-light" "purple" "purple-light" "red" "red-light" "yellow" "yellow-light"
do 
	echo "Color: $color" 
	cp -a _BASE "adminlte_$color"
	sed -i "s/skin-blue/skin-$color/g" "adminlte_$color/index.tpl"
	zip -r "adminlte_$color.zip" "adminlte_$color"
	rm -rf "adminlte_$color"
done

rm -rf _BASE