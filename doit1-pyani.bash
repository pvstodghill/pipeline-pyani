#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------

rm -rf ${PYANI}
mkdir -p ${PYANI}

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
	  --indir ${INPUTS} \
	  --outdir ${PYANI}/${METHOD} \
	  --graphics \
	  --workers ${THREADS}
done


# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 '# Done.'

