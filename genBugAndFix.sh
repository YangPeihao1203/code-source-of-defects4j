#!/bin/bash

set -e

for bug in $(seq 1 18);
do 
	defects4j checkout -p Codec -v ${bug}b -w ~/projects/codec_bug/codec_${bug};
done


for bug in $(seq 1 18);     
do      
    defects4j checkout -p Codec -v ${bug}f -w ~/projects/codec_fix/codec_${bug};
done    


