################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
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

PKG_PYNAME="cryptography"
PKG_NAME="python-${PKG_PYNAME}"
PKG_VERSION="2.0.3"
PKG_SOURCE_DIR="$PKG_PYNAME-$PKG_VERSION*"
PKG_SHA256="adbb7ddb9623616ea2c0354b7ce0506eee529b7f2d0e3894e513de5b8dce4ef8"
PKG_ARCH="any"
PKG_LICENSE="Apache"
PKG_SITE="https://cryptography.io/"
PKG_URL="https://github.com/pyca/cryptography/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 distutilscross:host openssl python-six python-cffi python-idna python-asn1crypto python-enum34 python-ipaddress"
PKG_SECTION="python/security"
PKG_SHORTDESC="cryptography is designed to expose cryptographic primitives and recipes to Python developers"
PKG_LONGDESC="cryptography is designed to expose cryptographic primitives and recipes to Python developers"
PKG_TOOLCHAIN="manual"

pre_configure_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDSHARED="$CC -shared"
  export LDFLAGS="$LDFLAGS -pthread"
}

make_target() {
  python setup.py build --cross-compile
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
}
