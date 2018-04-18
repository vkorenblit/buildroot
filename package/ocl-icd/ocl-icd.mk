################################################################################
#
# ocl-icd
#
################################################################################

OCL_ICD_VERSION = v2.2.12
OCL_ICD_SITE = $(call github,OCL-dev,ocl-icd,$(OCL_ICD_VERSION))
# Fetched from github, no configure script 
OCL_ICD_AUTORECONF = YES
OCL_ICD_INSTALL_STAGING = YES

define OCL_ICD_INSTALL_CL_HEADERS
	mkdir -p $(STAGING_DIR)/usr/include/CL
	$(INSTALL) -D -m 0755 $(@D)/khronos-headers/CL/* $(STAGING_DIR)/usr/include/CL/
endef

OCL_ICD_PRE_CONFIGURE_HOOKS += OCL_ICD_INSTALL_CL_HEADERS

$(eval $(autotools-package))
