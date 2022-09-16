#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------
# Run pyani
# ------------------------------------------------------------------------

echo 1>&2 '# Run pyani'

for METHOD in ${METHODS} ; do
    echo "## ${METHOD}"
    rm -rf ${DATA}/${METHOD}
    average_nucleotide_identity.py \
	  --method ${METHOD} \
	  --verbose \
	  --indir ${DATA}/inputs \
	  --outdir ${DATA}/${METHOD} \
	  --graphics \
	  --workers ${THREADS}
done


# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 '# Done.'

