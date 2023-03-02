# directory into which the results are written.
#DATA=.
#DATA=data # default

# ------------------------------------------------------------------------

COLLECTION=../collection/data

# ------------------------------------------------------------------------

METHODS=
METHODS+=" ANIm"
# METHODS+=" ANIb"
# METHODS+=" ANIblastall"
# METHODS+=" TETRA"

# ------------------------------------------------------------------------

# # Uncomment to get packages from HOWTO
# PACKAGES_FROM=howto

# Uncomment to use conda
PACKAGES_FROM=conda
CONDA_ENV=pipeline-pyani

#THREADS=$(nproc --all)

# ------------------------------------------------------------------------
