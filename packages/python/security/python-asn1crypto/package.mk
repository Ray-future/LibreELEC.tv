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

PKG_PYNAME="asn1crypto"
PKG_NAME="python-${PKG_PYNAME}"
PKG_VERSION="0.22.0"
PKG_SOURCE_DIR="$PKG_PYNAME-$PKG_VERSION*"
PKG_SHA256="cbbadd640d3165ab24b06ef25d1dca09a3441611ac15f6a6b452474fdf0aed1a"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="http://pypi.python.org/pypi/asn1crypto"
PKG_URL="https://files.pythonhosted.org/packages/source/${PKG_PYNAME:0:1}/$PKG_PYNAME/$PKG_PYNAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 distutilscross:host"
PKG_SECTION="python/system"
PKG_SHORTDESC="Fast ASN.1 parser and serializer"
PKG_LONGDESC="Fast ASN.1 parser and serializer with definitions for private keys, public keys, certificates, CRL, OCSP, CMS, PKCS#3, PKCS#7, PKCS#8, PKCS#12, PKCS#5, X.509 and TSP"
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
