################################################################################
#
# libclc
#
################################################################################

# There are only two releases: release_35 and release_38, but the last 
# commit is from 2 years ago. Master has some recent activity.
LIBCLC_VERSION = 00236279a293b3737dee08c14f25923a889d2795
LIBCLC_SITE = https://git.llvm.org/git/libclc
LIBCLC_SITE_METHOD = git
LIBCLC_LICENSE = NCSA
LIBCLC_LICENSE_FILES = LICENSE.TXT

LIBCLC_DEPENDENCIES = host-clang host-llvm
LIBCLC_INSTALL_STAGING = YES

# C++ compiler is used to build a small tool (prepare-builtins) for the host.
# It must be built with the C++ compiler from the host
LIBCLC_CONF_OPTS = --with-llvm-config=$(HOST_DIR)/usr/bin/llvm-config \
	--prefix="/usr" \
	--pkgconfigdir="/usr/lib/pkgconfig" \
	--with-cxx-compiler=$(HOSTCXX)

define LIBCLC_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.py $(LIBCLC_CONF_OPTS))
endef

define LIBCLC_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define LIBCLC_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
endef

define LIBCLC_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
endef

$(eval $(generic-package))
