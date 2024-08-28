################################################################################
#
# qt6languageserver
#
################################################################################

QT6LANGUAGESERVER_VERSION = $(QT6_VERSION)
QT6LANGUAGESERVER_SITE = $(QT6_SITE)
QT6LANGUAGESERVER_SOURCE = qtlanguageserver-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6LANGUAGESERVER_VERSION).tar.xz
QT6LANGUAGESERVER_INSTALL_STAGING = YES
QT6LANGUAGESERVER_SUPPORTS_IN_SOURCE_BUILD = NO

QT6LANGUAGESERVER_CMAKE_BACKEND = ninja

QT6LANGUAGESERVER_LICENSE = \
	BSD-3-Clause (buildsystem), \
	GFDL-1.3-no-invariants (docs), \
	GPL-3.0 (tests), \
	GPL-3.0 with Qt-GPL-exception-1.0 (utils), \
	LGPL-3.0 or GPL-2.0 or GPL-3.0

QT6LANGUAGESERVER_LICENSE_FILES = \
	LICENSES/BSD-3-Clause.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/Qt-GPL-exception-1.0.txt

QT6LANGUAGESERVER_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF

QT6LANGUAGESERVER_DEPENDENCIES = \
	qt6base

$(eval $(cmake-package))
