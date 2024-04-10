################################################################################
#
# qt6wayland
#
################################################################################

QT6WAYLAND_VERSION = $(QT6_VERSION)
QT6WAYLAND_SITE = $(QT6_SITE)
QT6WAYLAND_SOURCE = qtwayland-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6WAYLAND_VERSION).tar.xz
QT6WAYLAND_INSTALL_STAGING = YES

QT6WAYLAND_SUPPORTS_IN_SOURCE_BUILD = NO

QT6WAYLAND_CMAKE_BACKEND = ninja

QT6WAYLAND_LICENSE = \
	GPL-2.0+ or LGPL-3.0, \
	GPL-3.0, GFDL-1.3 no invariants (docs)

QT6WAYLAND_LICENSE_FILES = \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt

QT6WAYLAND_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF \
	-DFEATURE_wayland_client=ON

ifeq ($(BR2_PACKAGE_QT6WAYLAND_COMPOSITOR),y)
QT6WAYLAND_CONF_OPTS += -DFEATURE_wayland_server=ON
else
QT6WAYLAND_CONF_OPTS += -DFEATURE_wayland_server=OFF
endif

HOST_QT6WAYLAND_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF

QT6WAYLAND_DEPENDENCIES = \
	qt6base \
	qt6declarative \
	host-qt6wayland \
	wayland \
	host-wayland

$(eval $(cmake-package))
$(eval $(host-cmake-package))
