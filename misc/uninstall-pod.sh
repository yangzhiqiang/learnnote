#!/bin/sh
for i in $( gem list --local --no-version | grep cocoapods );
do 
            gem uninstall $i; 
done

rm -rf ~/.cocoapods/
