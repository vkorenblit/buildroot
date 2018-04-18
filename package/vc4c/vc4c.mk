################################################################################
#
# vc4c
#
################################################################################

VC4C_VERSION = 6bb0c896c06b0b4b1e63c093f705173ff7f503c9
VC4C_SITE = $(call github,doe300,VC4C,$(VC4C_VERSION))
VC4C_LICENSE = MIT
VC4C_LICENSE_FILES = LICENSE

VC4C_DEPENDENCIES = clang rpi-userland vc4clstdlib
VC4C_INSTALL_STAGING = YES

VC4C_CONF_OPTS += -DBUILD_DEB_PACKAGE=OFF \
	-DLLVMIR_FRONTEND=OFF \
	-DLLVMLIB_FRONTEND=ON \
	-DVC4CL_STDLIB_HEADER_SOURCE="$(STAGING_DIR)/usr/local/include/vc4cl-stdlib/VC4CLStdLib.h" \
	-DLLVM_CONFIG_PATH:FILEPATH=$(STAGING_DIR)/usr/bin/llvm-config \
	-DCLANG_FOUND="$(HOST_DIR)/bin/clang"

# VC4C calls clang binaries, so they must be installed on the target
define VC4C_COPY_CLANG_BINARIES_TO_TARGET
	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/bin/clang* \
		$(TARGET_DIR)/usr/bin/
endef

# Pre compile header is needed on runtime
define VC4C_INSTALL_PCH
	$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/local/include/vc4cl-stdlib/VC4CLStdLib.h.pch \
		$(TARGET_DIR)/usr/local/include/vc4cl-stdlib/VC4CLStdLib.h.pch
endef

VC4C_POST_INSTALL_TARGET_HOOKS += VC4C_COPY_CLANG_BINARIES_TO_TARGET
VC4C_POST_INSTALL_TARGET_HOOKS += VC4C_INSTALL_PCH

$(eval $(cmake-package))
