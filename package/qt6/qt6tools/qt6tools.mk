################################################################################
#
# qt6tools
#
################################################################################

QT6TOOLS_VERSION = $(QT6_VERSION)
QT6TOOLS_SITE = $(QT6_SITE)
QT6TOOLS_SOURCE = qttools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6TOOLS_VERSION).tar.xz
QT6TOOLS_INSTALL_STAGING = YES
QT6TOOLS_SUPPORTS_IN_SOURCE_BUILD = NO

QT6TOOLS_CMAKE_BACKEND = ninja

QT6TOOLS_LICENSE = \
	Apache-2.0 and MIT (litehtml-gumbo), \
	Apache-2.0 with LLVM-exception (llvm_clang_typename_namespace), \
	BSD-3-Clause (buildsystem, examples, litehtml, snippets), \
	BSL-1.0 (catch2), \
	GFDL-1.3-no-invariants (docs), \
	GPL-3.0 (tests), \
	GPL-3.0 with Qt-GPL-exception-1.0 (tests, tools, utils), \
	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)

QT6TOOLS_LICENSE_FILES = \
	LICENSES/BSD-3-Clause.txt \
	LICENSES/BSL-1.0.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/Qt-GPL-exception-1.0.txt \
	src/assistant/qlitehtml/src/3rdparty/GUMBO-AUTHORS.txt \
	src/assistant/qlitehtml/src/3rdparty/litehtml/LICENSE \
	src/qdoc/catch/CATCH_LICENSE.txt \
	src/qdoc/qdoc/src/qdoc/clang/AST/LLVM_LICENSE.txt

QT6TOOLS_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF

QT6TOOLS_DEPENDENCIES = \
	qt6base \
	host-qt6tools

ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
QT6TOOLS_DEPENDENCIES += qt6declarative
endif

HOST_QT6TOOLS_DEPENDENCIES = host-qt6base

$(eval $(cmake-package))
$(eval $(host-cmake-package))
