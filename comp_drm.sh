#!/bin/bash
# MV: compile libdrm
DRM_PREFIX="/usr/mesa"
DRM_CLONE_DIR="drm"
#DRM_VER="2.4.76"
DRM_VER="2.4.96"

if [[ ! -d "${DRM_CLONE_DIR}" ]]; then
	git clone git://anongit.freedesktop.org/mesa/drm "${DRM_CLONE_DIR}"
fi

pushd "${DRM_CLONE_DIR}"
git checkout tags/libdrm-${DRM_VER}

./autogen.sh \
	--prefix="${DRM_PREFIX}" \
	--libdir="${DRM_PREFIX}/lib/arm-linux-gnueabihf" \
	--disable-intel \
	--disable-radeon \
	--disable-amdgpu \
	--disable-nouveau \
	--disable-vmwgfx \
	--disable-freedreno


make -j2 && make install

