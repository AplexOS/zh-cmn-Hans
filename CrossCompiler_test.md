# ECM_5206 软件交叉编译例程

## 一、交叉编译器下载，以及交叉编译环境的配置
* 交叉编译器下载地址：
  [cc](https://pan.baidu.com/s/1mgyYfos?errno=0&errmsg=Auth%20Login%20Sucess&&bduss=&ssnerror=0&traceid=)
  * 下载完成之后，放入 Ubuntu14.04 以上操作系统上
* 执行如下命令进行安装相关软件以及下载相关代码
````shell
   sudo apt-get install   libc6:i386   libstdc++6:i386   libncurses5:i386   zlib1g:i386
````
* 解压 `arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2`
```shell
  tar -xvf arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
```
* 将下面代码加入到 `~/.bashrc` 最后一行
```shell
  export PATH=$PATH:~/test/arm-2014.05/bin
```
  * 上面的 `$PATH:` 后面的是交叉编译器的 `bin` 目录
* 重启 Ubuntu ， 使环境变量生效
* 重启后，执行如下命令
```shell
   arm-none-linux-gnueabi-gcc -v
```
```shell
Using built-in specs.
COLLECT_GCC=arm-none-linux-gnueabi-gcc
COLLECT_LTO_WRAPPER=/home/sbc_7109_454_pdk3/test/arm-2014.05/bin/../libexec/gcc/arm-none-linux-gnueabi/4.8.3/lto-wrapper
Target: arm-none-linux-gnueabi
Configured with: /scratch/maciej/arm-linux-2014.05-rel/src/gcc-4.8-2014.05/configure --build=i686-pc-linux-gnu --host=i686-pc-linux-gnu --target=arm-none-linux-gnueabi --enable-threads --disable-libmudflap --disable-libssp --disable-libstdcxx-pch --enable-extra-sgxxlite-multilibs --with-arch=armv5te --with-gnu-as --with-gnu-ld --with-specs='%{save-temps: -fverbose-asm} %{funwind-tables|fno-unwind-tables|mabi=*|ffreestanding|nostdlib:;:-funwind-tables} -D__CS_SOURCERYGXX_MAJ__=2014 -D__CS_SOURCERYGXX_MIN__=5 -D__CS_SOURCERYGXX_REV__=29' --enable-languages=c,c++ --enable-shared --enable-lto --enable-symvers=gnu --enable-__cxa_atexit --with-pkgversion='Sourcery CodeBench Lite 2014.05-29' --with-bugurl=https://sourcery.mentor.com/GNUToolchain/ --disable-nls --prefix=/opt/codesourcery --with-sysroot=/opt/codesourcery/arm-none-linux-gnueabi/libc --with-build-sysroot=/scratch/maciej/arm-linux-2014.05-rel/install/opt/codesourcery/arm-none-linux-gnueabi/libc --with-gmp=/scratch/maciej/arm-linux-2014.05-rel/obj/pkg-2014.05-29-arm-none-linux-gnueabi/arm-2014.05-29-arm-none-linux-gnueabi.extras/host-libs-i686-pc-linux-gnu/usr --with-mpfr=/scratch/maciej/arm-linux-2014.05-rel/obj/pkg-2014.05-29-arm-none-linux-gnueabi/arm-2014.05-29-arm-none-linux-gnueabi.extras/host-libs-i686-pc-linux-gnu/usr --with-mpc=/scratch/maciej/arm-linux-2014.05-rel/obj/pkg-2014.05-29-arm-none-linux-gnueabi/arm-2014.05-29-arm-none-linux-gnueabi.extras/host-libs-i686-pc-linux-gnu/usr --with-isl=/scratch/maciej/arm-linux-2014.05-rel/obj/pkg-2014.05-29-arm-none-linux-gnueabi/arm-2014.05-29-arm-none-linux-gnueabi.extras/host-libs-i686-pc-linux-gnu/usr --with-cloog=/scratch/maciej/arm-linux-2014.05-rel/obj/pkg-2014.05-29-arm-none-linux-gnueabi/arm-2014.05-29-arm-none-linux-gnueabi.extras/host-libs-i686-pc-linux-gnu/usr --disable-libgomp --disable-libitm --enable-libatomic --disable-libssp --enable-poison-system-directories --with-build-time-tools=/scratch/maciej/arm-linux-2014.05-rel/install/opt/codesourcery/arm-none-linux-gnueabi/bin --with-build-time-tools=/scratch/maciej/arm-linux-2014.05-rel/install/opt/codesourcery/arm-none-linux-gnueabi/bin SED=sed
Thread model: posix
```
  * 如果有提示版本信息，表示安装成功，如果没有，请检查上述步骤。

## 二、编译简单的程序
* 代码如下
```shell
  sbc_7109_454_pdk3@aplex:~/test$ cat test.c
  #include <stdio.h>

  int main(void)
  {
      printf("test hello world\n");
      return 0;
  }
```
```shell
  arm-none-linux-gnueabi-gcc test.c -o test
```

## 三、放入文件系统制作成ubi.img重启烧录或者通过 FTP 登录
* 然后运行，如下结果
```shell
  chmod +x test
  ./test
  test hello world
```
