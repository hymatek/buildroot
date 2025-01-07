################################################################################
#
# qt6sensors
#
################################################################################

QT6SENSORS_VERSION = $(QT6_VERSION)
QT6SENSORS_SITE = $(QT6_SITE)
QT6SENSORS_SOURCE = qtsensors-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SENSORS_VERSION).tar.xz
QT6SENSORS_INSTALL_STAGING = YES
QT6SENSORS_SUPPORTS_IN_SOURCE_BUILD = NO
QT6SENSORS_CMAKE_BACKEND = ninja
QT6SENSORS_LICENSE = LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)

QT6SENSORS_LICENSE_FILES = \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt

QT6SENSORS_CONF_OPTS = \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF \
	-DQT_HOST_PATH=$(HOST_DIR)

QT6SENSORS_DEPENDENCIES = qt6base

ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
QT6SENSORS_DEPENDENCIES += qt6declarative
endif

$(eval $(cmake-package))
