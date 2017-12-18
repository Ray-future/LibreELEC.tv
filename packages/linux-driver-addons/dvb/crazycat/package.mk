################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016-present Team LibreELEC
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

PKG_NAME="crazycat"
PKG_VERSION="2017-11-13"
PKG_SHA256="14d951eb8d40cee40d601d7c737bca07171d8b4f201d63d5e70a24c4841f9d73"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/crazycat69/linux_media"
PKG_URL="$DISTRO_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_BUILD_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver.dvb"
PKG_LONGDESC="DVB driver for TBS cards with CrazyCats additions."

PKG_IS_ADDON="yes"
PKG_IS_KERNEL_PKG="yes"
PKG_ADDON_IS_STANDALONE="yes"
PKG_ADDON_NAME="DVB drivers for TBS (CrazyCat)"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_VERSION="${ADDON_VERSION}.${PKG_REV}"

if [ $LINUX = "amlogic-3.14" -o $LINUX = "amlogic-3.10" ]; then
  PKG_PATCH_DIRS="amlogic"
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET wetekdvb"
fi

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""

}

make_target() {
  make SRCDIR=$(kernel_path) untar

  # copy config file
  if [ "$PROJECT" = Generic ]; then
    if [ -f $PKG_DIR/config/generic.config ]; then
      cp $PKG_DIR/config/generic.config v4l/.config
    fi
  else
    if [ -f $PKG_DIR/config/usb.config ]; then
      cp $PKG_DIR/config/usb.config v4l/.config
    fi
  fi

  # add menuconfig to edit .config
  make VER=$KERNEL_VER SRCDIR=$(kernel_path)
}

makeinstall_target() {
  if [ $PROJECT = "WeTek_Play" ]; then
    cp -P $(get_build_dir wetekdvb)/driver/wetekdvb_mb.ko "$PKG_BUILD/v4l/wetekdvb.ko"
  fi
  if [ $PROJECT = "WeTek_Play_2" ]; then
    cp -P $(get_build_dir wetekdvb)/driver/wetekdvb_play2_mb.ko "$PKG_BUILD/v4l/wetekdvb.ko"
  fi
  install_driver_addon_files "$PKG_BUILD/v4l/"
}
