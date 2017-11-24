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

PKG_PYNAME="cffi"
PKG_NAME="python-${PKG_PYNAME}"
PKG_VERSION="1.11.0"
PKG_SOURCE_DIR="$PKG_PYNAME-$PKG_VERSION*"
PKG_SHA256="5f4ff33371c6969b39b293d9771ee91e81d26f9129be093ca1b7be357fcefd15"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="http://pypi.python.org/pypi/cffi"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_PYNAME:0:1}/$PKG_PYNAME/$PKG_PYNAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="pycparser:host libffi:host"
PKG_DEPENDS_TARGET="toolchain Python2 distutilscross:host pycparser libffi"
PKG_SECTION="python/system"
PKG_SHORTDESC="Foreign Function Interface for Python calling C code."
PKG_LONGDESC="Foreign Function Interface for Python calling C code."
PKG_TOOLCHAIN="manual"

pre_build_host() {
  mkdir -p $PKG_BUILD/.$HOST_NAME
  cp -a $PKG_BUILD/* $PKG_BUILD/.$HOST_NAME/
  export PYTHONXCPREFIX="$TOOLCHAIN"
}

make_host() {
  cd $PKG_BUILD/.$HOST_NAME/
  python setup.py build -x
}

makeinstall_host() {
  python setup.py install --prefix=$TOOLCHAIN
}

pre_build_target() {
  mkdir -p $PKG_BUILD/.$TARGET_NAME
  cp -a $PKG_BUILD/* $PKG_BUILD/.$TARGET_NAME/
}

pre_make_target() {
  strip_lto
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDSHARED="$CC -shared"
}

make_target() {
  cd $PKG_BUILD/.$TARGET_NAME/
  python setup.py build --cross-compile
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
  rm -rf $INSTALL/usr/lib/python*/site-packages/*/tests
}
