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
    -DQT_FEATURE_qml_profiler=ON \
    -DQT_FEATURE_thread=ON \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF

HOST_QT6DECLARATIVE_CONF_OPTS = \
    -DQT_FEATURE_qml_profiler=ON \
    -DQT_FEATURE_thread=ON \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF


QT6DECLARATIVE_DEPENDENCIES = \
	qt6base \
	qt6shadertools \
	qt6languageserver \
	qt6svg \
	host-qt6base \
	host-qt6shadertools \
	host-qt6declarative \

$(eval $(cmake-package))
$(eval $(host-cmake-package))
