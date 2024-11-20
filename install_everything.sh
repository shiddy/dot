#!/bin/bash

for line in $(find . -type d -maxdepth 1 | sed "s|.\/||" | grep -v -e .git -e "\."); do
        stow -d $(pwd) -t ~ $line
done
