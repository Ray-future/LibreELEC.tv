################################################################################
#      This file is part of LibreELEC - https://LibreELEC.tv
#      Copyright (C) 2016 Team LibreELEC
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
PKG_NAME="pcscd-addon"
PKG_VERSION="4.5"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain pcsc-lite libusb ccid"
PKG_PRIORITY="optional"
PKG_SECTION="service/system"
PKG_SHORTDESC="Middleware to access a smart card using SCard API (PC/SC)"
PKG_LONGDESC="Middleware to access a smart card using SCard API (PC/SC)"
PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_PROVIDES=""
PKG_ADDON_REPOVERSION="9.0"
PKG_AUTORECONF="no"

PKG_MAINTAINER="Stefan Saraev (seo at irc.freenode.net)"

make_target() {
  : # nop
}

makeinstall_target() {
  : # nop
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin/
    cp -Pa $(get_build_dir pcsc-lite)/.install_pkg/usr/sbin/pcscd $ADDON_BUILD/$PKG_ADDON_ID/bin/pcscd.bin

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/drivers/serial
    cp -Pa $(get_build_dir ccid)/.$TARGET_NAME/src/.libs/libccidtwin.so $ADDON_BUILD/$PKG_ADDON_ID/drivers/serial

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/drivers/ifd-ccid.bundle/Contents/Linux/
    cp -Pa $(get_build_dir ccid)/.$TARGET_NAME/src/.libs/libccid.so $ADDON_BUILD/$PKG_ADDON_ID/drivers/ifd-ccid.bundle/Contents/Linux/
    cp -Pa $(get_build_dir ccid)/.$TARGET_NAME/src/Info.plist $ADDON_BUILD/$PKG_ADDON_ID/drivers/ifd-ccid.bundle/Contents

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/config
    cp -Pa $PKG_DIR/config/* $ADDON_BUILD/$PKG_ADDON_ID/config/
}
