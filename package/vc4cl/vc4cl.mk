################################################################################
#
# vc4cl
#
################################################################################

VC4CL_VERSION = f931945fcf65e8b372b970e4250627bc2b0e955f
VC4CL_SITE = $(call github,doe300,VC4CL,$(VC4CL_VERSION))
VC4CL_LICENSE = MIT
VC4CL_LICENSE_FILES = LICENSE

VC4CL_DEPENDENCIES = vc4c ocl-icd
VC4CL_INSTALL_STAGING = YES

VC4CL_CONF_OPTS += -DBUILD_DEB_PACKAGE=OFF \
	-DCROSS_COMPILE=ON \
	-DBUILD_ICD=ON \
	-DIMAGE_SUPPORT=ON \
	-DVC4C_HEADER_PATH="$(STAGING_DIR)/usr/include/vc4cc/VC4C.h" \
	-DVC4CC_LIBRARY="$(STAGING_DIR)/usr/lib/libVC4CC.so" \
	-DVC4C_TOOLS_HEADER_PATH="$(STAGING_DIR)/usr/include/vc4cc/tools.h" \
	-DBCMHOST_LIBRARY="$(STAGING_DIR)/usr/lib/libbcm_host.so"

$(eval $(cmake-package))
