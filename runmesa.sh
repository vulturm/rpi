#!/bin/bash
#MV: execute app with our newly compiled mesa

MESA_PREFIX="/usr/mesa"
LD_LIBRARY_PATH=${MESA_PREFIX}/lib/arm-linux-gnueabihf \
	LIBGL_DRIVERS_PATH=${MESA_PREFIX}/lib/arm-linux-gnueabihf/dri \
	GBM_DRIVERS_PATH=${MESA_PREFIX}/lib/arm-linux-gnueabihf \
	$@
