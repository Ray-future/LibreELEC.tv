# Allow upgrades between arm and aarch64
if [ "$1" = "@PROJECT@.arm" -o "$1" = "@PROJECT@.aarch64" ]; then
  exit 0
else
  exit 1
fi
