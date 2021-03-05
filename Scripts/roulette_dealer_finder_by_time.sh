!/bin/bash

grep -i "$1" *$2* | awk '{print$5, $6}'
