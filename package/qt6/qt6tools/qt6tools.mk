################################################################################
#
# qt6tools
#
################################################################################

QT6TOOLS_VERSION = $(QT6_VERSION)
QT6TOOLS_SITE = $(QT6_SITE)
QT6TOOLS_SOURCE = qttools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6TOOLS_VERSION).tar.xz
QT6TOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
QT6TOOLS_CMAKE_BACKEND = ninja
QT6TOOLS_LICENSE = GPL-3.0 with Qt-GPL-exception-1.0 (host linguist tools)

QT6TOOLS_LICENSE_FILES = \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/Qt-GPL-exception-1.0.txt

# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.2
HOST_QT6TOOLS_CONF_OPTS = \
	-DFEATURE_assistant=OFF \
	-DFEATURE_attributionsscanner=OFF \
	-DFEATURE_clang=OFF \
	-DFEATURE_clang-rtti=OFF \
	-DFEATURE_clangcpp=OFF \
	-DFEATURE_designer=OFF \
	-DFEATURE_distancefieldgenerator=OFF \
	-DFEATURE_kmap2qmap=OFF \
	-DFEATURE_pixeltool=OFF \
	-DFEATURE_qdbus=OFF \
	-DFEATURE_qdoc=OFF \
	-DFEATURE_qev=OFF \
	-DFEATURE_qtattributionsscanner=OFF \
	-DFEATURE_qtdiag=OFF \
	-DFEATURE_qtplugininfo=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF

HOST_QT6TOOLS_DEPENDENCIES = host-qt6base

ifeq ($(BR2_PACKAGE_HOST_QT6DECLARATIVE),y)
# https://code.qt.io/cgit/qt/qttools.git/tree/src/linguist/lupdate/CMakeLists.txt?h=6.8.2#n61
HOST_QT6TOOLS_DEPENDENCIES += host-qt6declarative
endif

ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
# https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.2#n78
# https://code.qt.io/cgit/qt/qttools.git/tree/src/CMakeLists.txt?h=6.8.2#n26
# https://code.qt.io/cgit/qt/qttools.git/tree/src/linguist/CMakeLists.txt?h=6.8.2#n8
HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
else
HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=OFF
endif

$(eval $(host-cmake-package))
