################################################################################
#
# qt6svg
#
################################################################################

QT6SVG_VERSION = $(QT6_VERSION)
QT6SVG_SITE = $(QT6_SITE)
QT6SVG_SOURCE = qtsvg-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SVG_VERSION).tar.xz
QT6SVG_INSTALL_STAGING = YES
QT6SVG_SUPPORTS_IN_SOURCE_BUILD = NO

QT6SVG_CMAKE_BACKEND = ninja

QT6SVG_LICENSE = \
	BSD-3-Clause (buildsystem, examples, snippets), \
	GFDL-1.3-no-invariants (docs), \
	GPL-3.0 (tests), \
	HPND-sell-variant (xsvg), \
	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)

QT6SVG_LICENSE_FILES = \
	LICENSES/BSD-3-Clause.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/Qt-GPL-exception-1.0.txt \
	src/svg/XSVG_LICENSE.txt

QT6SVG_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF

QT6SVG_DEPENDENCIES = \
	host-pkgconf \
	qt6base

$(eval $(cmake-package))
$(eval $(host-cmake-package))
