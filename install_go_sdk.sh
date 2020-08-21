# https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
VERSION='1.15';                             # 设置go语言版本 指定你的版本
OS=linux                                    # 可选值 linux darwin
ARCH=amd64                                  # 可选值 但是必须与你的操作系统匹配 amd64, 386, arm (树莓派raspberryPi3), arm64, s390x, ppc64le
GZFILE="go$VERSION.$OS-$ARCH.tar.gz"        # 下载的安装名称包含arch
wget "https://dl.google.com/go/${GZFILE}";
rm -rf /usr/local/go;                       # 删除旧的go安装文件
tar -C /usr/local -xzf $GZFILE;             # 解压文件到 /usr/local/go目录中

cat << "EOF" >> ~/.bashrc

# environment for go sdk
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=/opt/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export GOPROXY=https://goproxy.cn,direct
export GO1111MODULE=on

EOF

mkdir -p $GOBIN;
