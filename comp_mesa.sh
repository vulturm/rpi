#!/bin/bash
MESA_PREFIX="/usr/mesa"
MESA_CLONE_DIR="mesa"
MESA_VER="18.1.9"

if [[ ! -d "${MESA_CLONE_DIR}" ]]; then
	git clone git://anongit.freedesktop.org/mesa/mesa "${MESA_CLONE_DIR}"
fi

pushd "${MESA_CLONE_DIR}"
git checkout tags/mesa-${MESA_VER}

export LIBDRM_CFLAGS="-I${MESA_PREFIX}/include/ -I${MESA_PREFIX}/include/libdrm/"
#export LIBDRM_CFLAGS="-I${MESA_PREFIX}/include/"
export LIBDRM_LIBS="-L${MESA_PREFIX}/lib/arm-linux-gnueabihf -ldrm"


./autogen.sh \
	--prefix="${MESA_PREFIX}" \
	--libdir="${MESA_PREFIX}/lib/arm-linux-gnueabihf" \
	--with-gallium-drivers=vc4 \
	--with-dri-drivers= \
	--with-platforms=x11,drm


make && make install

