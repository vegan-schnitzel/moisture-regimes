#!/bin/bash

CDO_FLGS="-L -O -f nc4"

# 2m air temperature = 167

for SIM in "SSP1" "SSP3" "SSP5" "plasim_ref_ln"
# reference sim in ingokir area
do
    DATA="/home/rw0064fu/models/project/exps/${SIM}/ANALYSIS/atm/daily/sfc_gmean/code_167"

    # compute climatology on 5-day means
    cdo $CDO_FLGS -ydayavg -timselavg,5 -del29feb -selyear,20/29 $DATA ${SIM}-tmp-clim.nc
    cdo $CDO_FLGS -ydaystd -timselavg,5 -del29feb -selyear,20/29 $DATA ${SIM}-tmp-clim-std.nc
done
