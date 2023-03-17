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

    MATRIX=${PYANI}/${METHOD}/${METHOD}_percentage_identity.tab

    ${PIPELINE}/scripts/make-clades.pl \
	       -M ${MATRIX} \
	       -c ${SPECIES_CUTOFF} \
	       -d ${CLADES}/${METHOD}_species.dot \
	       > ${CLADES}/${METHOD}_species.txt

    ${PIPELINE}/scripts/make-clades.pl \
	       -M ${MATRIX} \
	       -c ${GENUS_CUTOFF} \
	       -d ${CLADES}/${METHOD}_genus.dot \
	       > ${CLADES}/${METHOD}_genus.txt
done

# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 '# Done.'

