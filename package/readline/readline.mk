################################################################################
#
# readline
#
################################################################################

READLINE_VERSION = 8.3
READLINE_SITE = $(BR2_GNU_MIRROR)/readline
READLINE_INSTALL_STAGING = YES
READLINE_DEPENDENCIES = ncurses host-autoconf
HOST_READLINE_DEPENDENCIES = host-ncurses host-autoconf
READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes \
	bash_cv_wcwidth_broken=no
READLINE_CONF_OPTS = \
	--disable-install-examples \
	--with-curses \
	--with-shared-termcap-library
READLINE_LICENSE = GPL-3.0+
READLINE_LICENSE_FILES = COPYING
READLINE_CPE_ID_VENDOR = gnu

ifeq ($(BR2_PACKAGE_READLINE_BRACKETED_PASTE),y)
READLINE_CONF_OPTS += --enable-bracketed-paste-default
else
READLINE_CONF_OPTS += --disable-bracketed-paste-default
endif

define READLINE_INSTALL_INPUTRC
	$(INSTALL) -D -m 644 package/readline/inputrc $(TARGET_DIR)/etc/inputrc
endef
READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_INSTALL_INPUTRC

# readline does not link its shared library against the curses/termcap
# library, leaving termcap symbols (UP, BC, PC) undefined. fakeroot runs
# its finalization script with $(HOST_DIR)/lib in LD_LIBRARY_PATH, so a
# readline-linked /bin/sh loads this host libreadline.so during root
# filesystem generation and aborts on the undefined symbols. Link it
# against the libncursesw that host-ncurses provides (it carries those
# symbols) via readline's SHLIB_LIBS.
HOST_READLINE_MAKE_OPTS += SHLIB_LIBS="-L$(HOST_DIR)/lib -lncursesw"

$(eval $(autotools-package))
$(eval $(host-autotools-package))
