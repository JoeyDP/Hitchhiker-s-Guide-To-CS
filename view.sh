#!/bin/bash

if [[ $1 -eq 0 ]] ; then
    echo 'Supply session number'
    exit 1
fi

SESSION=$1
shift # consume first arg

pdfpc --notes=right -g $@ "Sessie_$SESSION/hitchhikers-guide-sessie-$SESSION-notes.pdf"
