#!/bin/bash

# Save default bison datadir
export _BISON_PKGDATADIR=$M4

#!/bin/bash
if [ $CONDA_BUILD = 0 ]; then
  M4=$CONDA_ENV_PATH/share/bison
else
  M4=$CONDA_DEFAULT_ENV/share/bison
fi

echo "setting m4 binary to $M4"
export M4
