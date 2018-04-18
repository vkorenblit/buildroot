################################################################################
#
# vc4clstdlib
#
################################################################################

VC4CLSTDLIB_VERSION = 3c70f9a1c5261a07aa3e5c901250631a8c2bb75a
VC4CLSTDLIB_SITE = $(call github,doe300,VC4CLStdLib,$(VC4CLSTDLIB_VERSION))
VC4CLSTDLIB_LICENSE = MIT
VC4CLSTDLIB_LICENSE_FILES = LICENSE

VC4CLSTDLIB_INSTALL_STAGING = YES

VC4CLSTDLIB_CONF_OPTS += -DBUILD_DEB_PACKAGE=OFF

$(eval $(cmake-package))
