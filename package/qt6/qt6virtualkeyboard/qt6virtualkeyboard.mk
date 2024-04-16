################################################################################
#
# qt6virtualkeyboard
#
################################################################################

QT6VIRTUALKEYBOARD_VERSION = $(QT6_VERSION)
QT6VIRTUALKEYBOARD_SITE = $(QT6_SITE)
QT6VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6VIRTUALKEYBOARD_VERSION).tar.xz
QT6VIRTUALKEYBOARD_INSTALL_STAGING = YES

QT6VIRTUALKEYBOARD_SUPPORTS_IN_SOURCE_BUILD = NO

QT6VIRTUALKEYBOARD_CMAKE_BACKEND = ninja

QT6VIRTUALKEYBOARD_LICENSE = \
	GPL-3.0-only, GFDL-1.3 no invariants (docs), \
	BSD-3-Clause

QT6VIRTUALKEYBOARD_LICENSE_FILES = \
	LICENSES/BSD-3-Clause.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LicenseRef-Qt-Commercial.txt \
	LICENSES/Qt-GPL-exception-1.0.txt \
	src/plugins/openwnn/3rdparty/openwnn/NOTICE \
	src/plugins/pinyin/3rdparty/pinyin/NOTICE \
	src/plugins/tcime/3rdparty/tcime/COPYING

QT6VIRTUALKEYBOARD_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF

QT6VIRTUALKEYBOARD_DEPENDENCIES = \
	qt6base \
	qt6declarative \
	qt6svg

$(eval $(cmake-package))
