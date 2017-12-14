# Allow upgrades between aarch64 and arm
PROJECT="ROCK64"
if [ "$1" = "${PROJECT}.aarch64" ] || [ "$1" = "${PROJECT}.arm" ]; then
  exit 0
else
  exit 1
fi
