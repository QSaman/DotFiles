#!/bin/bash

echo 'EXCLUDES="README.md LICENSE bootstrap.sh"' > ~/.rcrc
rcup -d "$PWD" -v
