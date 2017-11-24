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

PKG_NAME="pynacl"
PKG_VERSION="1.1.2"
PKG_SHA256="448897f0cfe3607dc23a871fa4405ef00926179df27ee8dfd0e46d42c60d8968"
PKG_ARCH="any"
PKG_LICENSE="Apache"
PKG_SITE="https://github.com/pyca/pynacl"
PKG_URL="https://github.com/pyca/pynacl/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 distutilscross:host python-cffi:host libsodium python-six python-cffi"
PKG_SECTION="python/security"
PKG_SHORTDESC="Python binding to the Networking and Cryptography (NaCl) library"
PKG_LONGDESC="PyNaCl is a Python binding to libsodium, which is a fork of the Networking and Cryptography library."
PKG_TOOLCHAIN="manual"

pre_configure_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDSHARED="$CC -shared"
  export SODIUM_INSTALL=system
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
