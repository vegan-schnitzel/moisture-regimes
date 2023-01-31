#!/bin/bash

CDO_FLGS="-L -O -f nc4"

# total precipitation = 009

for SIM in "SSP1" "SSP3" "SSP5" "plasim_ref_ln"
# reference sim in ingokir area
do
    DATA="/home/rw0064fu/models/project/exps/${SIM}/ANALYSIS/atm/daily/sfc/code_009"
    # compute (time mean of) climatology on 5-day means
    cdo $CDO_FLGS -timavg -ydayavg -timselavg,5 -del29feb -selyear,20/29 $DATA ${SIM}-pre-clim.nc
    cdo $CDO_FLGS -timmax -ydaystd -timselavg,5 -del29feb -selyear,20/29 $DATA ${SIM}-pre-clim-std.nc
done

# compute anomaly

#for SIM in "SSP1" "SSP3" "SSP5"
#do 
#    cdo $CDO_FLGS -sub ${SIM}-pre-clim.nc plasim_ref_ln-pre-clim.nc ${SIM}-pre-anom.nc
#done
