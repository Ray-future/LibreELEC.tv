################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2017 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_PYNAME="iso8601"
PKG_NAME="python-${PKG_PYNAME}"
PKG_VERSION="0.1.12"
PKG_SOURCE_DIR="$PKG_PYNAME-$PKG_VERSION*"
PKG_SHA256="49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="http://pypi.python.org/pypi/iso8601"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_PYNAME:0:1}/$PKG_PYNAME/$PKG_PYNAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 distutilscross:host"
PKG_SECTION="python/system"
PKG_SHORTDESC="Simple module to parse ISO 8601 dates"
PKG_LONGDESC="Simple module to parse ISO 8601 dates"
PKG_TOOLCHAIN="manual"

make_target() {
  :
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
  rm -rf $INSTALL/usr/lib/python*/site-packages/*/tests
}
