# Build container

**Clone repo**

* `cd ~/`
* `git clone --branch rockchip --single-branch https://github.com/Kwiboo/LibreELEC.tv.git LibreELEC`

**Build container**

* `cd ~/LibreELEC`
* `docker build --pull -t libreelec tools/docker`

**Build image inside container**

* `docker run -v ~/:/home/docker -h libreelec -it libreelec`
* `cd ~/LibreELEC`
* `PROJECT=Rockchip DEVICE=TinkerBoard ARCH=arm make image`
