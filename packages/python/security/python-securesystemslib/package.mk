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

PKG_PYNAME="securesystemslib"
PKG_NAME="python-${PKG_PYNAME}"
PKG_VERSION="0.10.7"
PKG_SOURCE_DIR="$PKG_PYNAME-$PKG_VERSION*"
PKG_SHA256="57b3f591f5043ec1cc77830fcdb03502b8b1a7abe8687d6f0e1dbd38510f816f"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/secure-systems-lab/securesystemslib"
PKG_URL="https://github.com/secure-systems-lab/securesystemslib/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 distutilscross:host pycryptodome pynacl python-cryptography python-six"
PKG_SECTION="python/security"
PKG_SHORTDESC="A library that provides cryptographic and general-purpose routines for Secure Systems Lab projects at NYU"
PKG_LONGDESC="A library that provides cryptographic and general-purpose routines for Secure Systems Lab projects at NYU"
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
