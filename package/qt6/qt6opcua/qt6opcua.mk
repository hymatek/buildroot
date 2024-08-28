################################################################################
#
# qt6opcua
#
################################################################################

QT6OPCUA_VERSION = $(QT6_VERSION)
QT6OPCUA_SITE = $(QT6_GIT)/qt/qtopcua.git
QT6OPCUA_SITE_METHOD = git
QT6OPCUA_INSTALL_STAGING = YES
QT6OPCUA_SUPPORTS_IN_SOURCE_BUILD = NO

QT6OPCUA_CMAKE_BACKEND = ninja

QT6OPCUA_LICENSE = \
	BSD-3-Clause (buildsystem, examples, snippets), \
	GFDL-1.3-no-invariants (docs), \
	GPL-3.0 (tests), \
	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins, tools), \
	MPL-2.0 and CC0-1.0 and CC-BY-SA-4.0 and BSD-3-Clause and Apache-2.0 and MIT (open62541)

QT6OPCUA_LICENSE_FILES = \
	LICENSES/BSD-3-Clause.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/Qt-GPL-exception-1.0.txt \
	src/3rdparty/open62541/AUTHORS \
	src/3rdparty/open62541/BSD-3-CLAUSE \
	src/3rdparty/open62541/CC-BY-SA-4.0 \
	src/3rdparty/open62541/LICENSE-2.0.txt \
	src/3rdparty/open62541/LICENSE-CC0 \
	src/3rdparty/open62541/MIT \
	src/3rdparty/open62541/mpl-2.0.815ca599c9df.txt

QT6OPCUA_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF

HOST_QT6OPCUA_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF

QT6OPCUA_DEPENDENCIES = \
	qt6base \
	host-qt6opcua

ifeq ($(BR2_PACKAGE_OPENSSL),y)
QT6OPCUA_DEPENDENCIES += openssl
endif

$(eval $(cmake-package))
$(eval $(host-cmake-package))
