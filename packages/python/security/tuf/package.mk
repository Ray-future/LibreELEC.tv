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

PKG_NAME="tuf"
PKG_VERSION="0.10.0"
PKG_SHA256="101b93ce59a5eb9c1f24a404625091b2530713170c80b0c857efd442fd0a7986"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://theupdateframework.github.io/"
PKG_URL="https://github.com/theupdateframework/tuf/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 distutilscross:host python-securesystemslib python-six python-iso8601"
PKG_SECTION="python/security"
PKG_SHORTDESC="The Update Framework"
PKG_LONGDESC="TUF: Like the S in HTTPS, a plug-and-play library for securing a software updater"
PKG_TOOLCHAIN="manual"

pre_configure_target() {
  cd $PKG_BUILD
  rm -rf .$TARGET_NAME

  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
}

make_target() {
  python setup.py build --cross-compile
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
  rm -rf $INSTALL/usr/bin
}
