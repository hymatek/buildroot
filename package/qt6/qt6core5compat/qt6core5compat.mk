################################################################################
#
# qt6core5compat
#
################################################################################

QT6CORE5COMPAT_VERSION = $(QT6_VERSION)
QT6CORE5COMPAT_SITE = $(QT6_SITE)
QT6CORE5COMPAT_SOURCE = qt5compat-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6CORE5COMPAT_VERSION).tar.xz
QT6CORE5COMPAT_INSTALL_STAGING = YES
QT6CORE5COMPAT_SUPPORTS_IN_SOURCE_BUILD = NO

QT6CORE5COMPAT_CMAKE_BACKEND = ninja

QT6CORE5COMPAT_LICENSE = \
	BSD-2-Clause (codecs), \
	BSD-3-Clause (buildsystem, examples, snippets, utils), \
	GFDL-1.3-no-invariants (docs), \
	GPL-3.0 (tests), \
	GPL-3.0 with Qt-GPL-exception-1.0 (utils), \
	LGPL-3.0 or GPL-2.0 or GPL-3.0 (codecs, modules, plugins)

QT6CORE5COMPAT_LICENSE_FILES = \
	LICENSES/BSD-3-Clause.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/Qt-GPL-exception-1.0.txt \
	src/core5/codecs/QBIG5CODEC_LICENSE.txt \
	src/core5/codecs/QBKCODEC_LICENSE.txt \
	src/core5/codecs/QEUCJPCODEC_LICENSE.txt \
	src/core5/codecs/QEUCKRCODEC_LICENSE.txt \
	src/core5/codecs/QJISCODEC_LICENSE.txt \
	src/core5/codecs/QSJISCODEC_LICENSE.txt \
	src/core5/codecs/QTSCIICODEC_LICENSE.txt

QT6CORE5COMPAT_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF

QT6CORE5COMPAT_DEPENDENCIES = \
	host-pkgconf \
	qt6base

$(eval $(cmake-package))
