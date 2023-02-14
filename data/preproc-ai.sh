#!/bin/bash

CDO_FLGS="-L -O -f nc4"

# compute aridity index (de martonne)

# create mask for sea
cdo $CDO_FLGS -setctomiss,0 -gtc,0 -remapcon,SSP1-pre-clim.nc -topo seamask.nc

for SIM in "plasim_ref_ln" "SSP5"
do
    # annual precipitation sum
    PRE="/home/rw0064fu/models/project/exps/${SIM}/ANALYSIS/atm/daily/sfc/code_009"
    cdo $CDO_FLGS -mul seamask.nc -timavg -yearsum -del29feb -selyear,20/29 $PRE ai-${SIM}-pre.nc

    # annual mean temperature
    TMP="/home/rw0064fu/models/project/exps/${SIM}/ANALYSIS/atm/daily/sfc/code_167"
    cdo $CDO_FLGS -mul seamask.nc -timavg -yearavg -del29feb -selyear,20/29 $TMP ai-${SIM}-tmp.nc

    # compute AI
    #cdo $CDO_FLGS -div -mulc,864500000 ai-pre-${SIM}.nc -addc,10 ai-tmp-${SIM}.nc ${SIM}-aridity-index.nc
done
