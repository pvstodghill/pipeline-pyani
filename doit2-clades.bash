#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------

rm -rf ${CLADES}
mkdir -p ${CLADES}

# ------------------------------------------------------------------------
# Make clades
# ------------------------------------------------------------------------

echo 1>&2 '# Make clades'

for METHOD in ${METHODS} ; do

    echo 1>&2 "## ${METHOD}"
    for f in ${PYANI}/${METHOD}/${METHOD}_percentage_identity.tab \
		     ${PYANI}/${METHOD}/${METHOD}_correlations.tab ; do
	if [ -e $f ] ; then
	    MATRIX=$f
	    break
	fi
    done
    if [ -z "$MATRIX" ] ; then
	echo 1>&2 "Did not matrix file"
	exit 1
    fi

    echo 1>&2 '### Make species list'
    ${PIPELINE}/scripts/make-clades.pl \
	       -M ${MATRIX} \
	       -c ${SPECIES_CUTOFF} \
	       > ${CLADES}/${METHOD}_species.txt

    echo 1>&2 '### Make genus list'
    ${PIPELINE}/scripts/make-clades.pl \
	       -M ${MATRIX} \
	       -c ${GENUS_CUTOFF} \
	       > ${CLADES}/${METHOD}_genus.txt

    echo 1>&2 '### Make .dot file'
    ${PIPELINE}/scripts/make-clades.pl \
	       -M ${MATRIX} \
	       -c ${GENUS_CUTOFF} \
	       -d ${CLADES}/${METHOD}.dot \
	       > /dev/null

done

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 '# Done.'

