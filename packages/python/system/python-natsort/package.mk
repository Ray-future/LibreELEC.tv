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

PKG_PYNAME="natsort"
PKG_NAME="python-${PKG_PYNAME}"
PKG_VERSION="5.1.0"
PKG_SOURCE_DIR="$PKG_PYNAME-$PKG_VERSION*"
PKG_SHA256="5db0fd17c9f8ef3d54962a6e46159ce4807c630f0931169cd15ce54f2ac395b9"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://pypi.python.org/pypi/natsort"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_PYNAME:0:1}/$PKG_PYNAME/$PKG_PYNAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 distutilscross:host"
PKG_SECTION="python/system"
PKG_SHORTDESC="Simple yet flexible natural sorting in Python"
PKG_LONGDESC="Simple yet flexible natural sorting in Python"
PKG_TOOLCHAIN="manual"

make_target() {
  :
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
}
