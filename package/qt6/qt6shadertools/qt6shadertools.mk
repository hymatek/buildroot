################################################################################
#
# qt6shadertools
#
################################################################################

QT6SHADERTOOLS_VERSION = $(QT6_VERSION)
QT6SHADERTOOLS_SITE = $(QT6_SITE)
QT6SHADERTOOLS_SOURCE = qtshadertools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SHADERTOOLS_VERSION).tar.xz
QT6SHADERTOOLS_INSTALL_STAGING = YES
QT6SHADERTOOLS_SUPPORTS_IN_SOURCE_BUILD = NO

QT6SHADERTOOLS_CMAKE_BACKEND = ninja

QT6SHADERTOOLS_LICENSE = \
	Apache-2.0 and urn:dje:license:khronos (SPIRV-Cross), \
	Apache-2.0 or MIT (SPIRV-Cross), \
	BSD-3-Clause (buildsystem), \
	BSD-3-Clause and urn:dje:license:khronos and Apache-2.0 and GPL-3.0+ with Bison-exception-2.2 and AML-glslang (glslang), \
	GFDL-1.3-no-invariants (docs), \
	GPL-3.0 (tests), \
	GPL-3.0 with Qt-GPL-exception-1.0 (qsb), \
	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules), \
	MIT (SPIRV-Cross)

QT6SHADERTOOLS_LICENSE_FILES = \
	LICENSES/BSD-3-Clause.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/Qt-GPL-exception-1.0.txt \
	src/3rdparty/SPIRV-Cross/COPYRIGHT.txt \
	src/3rdparty/SPIRV-Cross/KHRONOS-LICENSE.txt \
	src/3rdparty/SPIRV-Cross/LICENSE \
	src/3rdparty/glslang/COPYRIGHT.txt \
	src/3rdparty/glslang/LICENSE.txt

QT6SHADERTOOLS_CONF_OPTS = \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF

QT6SHADERTOOLS_DEPENDENCIES = \
	host-pkgconf \
	qt6base \
	host-qt6shadertools

HOST_QT6SHADERTOOLS_DEPENDENCIES = \
	host-qt6base

$(eval $(cmake-package))
$(eval $(host-cmake-package))
