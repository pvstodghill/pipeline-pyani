#! /bin/bash

. $(dirname ${BASH_SOURCE[0]})/doit-preamble.bash

# ------------------------------------------------------------------------
# Making local copy of genomes
# ------------------------------------------------------------------------

echo 1>&2 '# Making local copy of genomes'

rm -rf ${DATA}/inputs
mkdir -p ${DATA}/inputs
cp --archive ${GENOMES}/*.fna ${DATA}/inputs


# ------------------------------------------------------------------------
# Done.
# ------------------------------------------------------------------------

echo 1>&2 '# Done.'

