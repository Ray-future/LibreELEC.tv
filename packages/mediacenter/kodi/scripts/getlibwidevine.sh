#!/bin/sh

#wait for network to get an ip address
sleep 30s

CDMDIR=$HOME/.kodi/cdm

[ ! -d $CDMDIR ] && mkdir -p $CDMDIR

if [ ! -f $CDMDIR/libwidevinecdm.so ]; then
  wget -qO- http://odroidxu.leeharris.me.uk/xu3/chromium-widevine-1.4.8.823-2-armv7h.pkg.tar.xz | \
    tar xJfO - usr/lib/chromium/libwidevinecdm.so > $CDMDIR/libwidevinecdm.so
  chmod 644 $CDMDIR/libwidevinecdm.so
fi

[ ! -s $CDMDIR/libwidevinecdm.so ] && rm -f $CDMDIR/libwidevinecdm.so
