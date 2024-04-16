################################################################################
#
# qt6declaratve
#
################################################################################

QT6DECLARATIVE_VERSION = $(QT6_VERSION)
QT6DECLARATIVE_SITE = $(QT6_SITE)
QT6DECLARATIVE_SOURCE = qtdeclarative-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6DECLARATIVE_VERSION).tar.xz
QT6DECLARATIVE_INSTALL_STAGING = YES

QT6DECLARATIVE_SUPPORTS_IN_SOURCE_BUILD = NO

QT6DECLARATIVE_CMAKE_BACKEND = ninja

QT6DECLARATIVE_LICENSE = \
	GPL-2.0+ or LGPL-3.0, \
	GPL-3.0, GFDL-1.3 no invariants (docs)

QT6DECLARATIVE_LICENSE_FILES = \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt

QT6DECLARATIVE_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF

HOST_QT6DECLARATIVE_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF

HOST_QT6DECLARATIVE_DEPENDENCIES = \
	host-qt6base

QT6DECLARATIVE_DEPENDENCIES = \
	host-qt6declarative \
	qt6base

ifeq ($(BR2_PACKAGE_QT6DECLARATIVE_QUICK),y)
HOST_QT6DECLARATIVE_DEPENDENCIES += \
	host-qt6shadertools
QT6DECLARATIVE_DEPENDENCIES += \
	host-qt6base \
	qt6shadertools

# We need host-qt6svg, when qt6svg is available to build the required
# svgtoqml host tool
ifeq ($(BR2_PACKAGE_QT6SVG),y)
HOST_QT6DECLARATIVE_DEPENDENCIES += host-qt6svg
endif

endif

$(eval $(cmake-package))
$(eval $(host-cmake-package))
