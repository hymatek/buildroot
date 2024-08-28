################################################################################
#
# qt6serialbus
#
################################################################################

QT6SERIALBUS_VERSION = $(QT6_VERSION)
QT6SERIALBUS_SITE = $(QT6_SITE)
QT6SERIALBUS_SOURCE = qtserialbus-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALBUS_VERSION).tar.xz
QT6SERIALBUS_INSTALL_STAGING = YES
QT6SERIALBUS_SUPPORTS_IN_SOURCE_BUILD = NO

QT6SERIALBUS_CMAKE_BACKEND = ninja

QT6SERIALBUS_LICENSE = \
	BSD-3-Clause (buildsystem, examples, snippets), \
	GFDL-1.3-no-invariants (docs), \
	GPL-3.0 (tests), \
	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins, tools)

QT6SERIALBUS_LICENSE_FILES = \
	LICENSES/BSD-3-Clause.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/Qt-GPL-exception-1.0.txt

QT6SERIALBUS_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF

QT6SERIALBUS_DEPENDENCIES = \
	qt6serialport

$(eval $(cmake-package))
