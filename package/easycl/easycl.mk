################################################################################
#
# easycl
#
################################################################################

EASYCL_VERSION = d4d47ff25fce4c761c8004ee15ebd12d90ca6f2a
EASYCL_SITE = $(call github,hughperkins,EasyCL,$(EASYCL_VERSION))
EASYCL_LICENSE = MPL-2.0
EASYCL_LICENSE_FILES = LICENSE.txt
EASYCL_INSTALL_STAGING = YES

EASYCL_CONF_OPTS += -DUSE_CLEW=OFF \
	-DBUILD_TESTS=ON

$(eval $(cmake-package))
