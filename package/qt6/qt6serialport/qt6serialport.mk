################################################################################
#
# qt6serialport
#
################################################################################

QT6SERIALPORT_VERSION = $(QT6_VERSION)
QT6SERIALPORT_SITE = $(QT6_SITE)
QT6SERIALPORT_SOURCE = qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALPORT_VERSION).tar.xz
QT6SERIALPORT_INSTALL_STAGING = YES
QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD = NO

QT6SERIALPORT_CMAKE_BACKEND = ninja

QT6SERIALPORT_LICENSE = \
	BSD-3-Clause (buildsystem, examples, snippets, tests), \
	GFDL-1.3-no-invariants (docs), \
	GPL-3.0 (tests), \
	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules)

QT6SERIALPORT_LICENSE_FILES = \
	LICENSES/BSD-3-Clause.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/Qt-GPL-exception-1.0.txt

QT6SERIALPORT_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF

QT6SERIALPORT_DEPENDENCIES = \
	host-pkgconf \
	qt6base

$(eval $(cmake-package))
