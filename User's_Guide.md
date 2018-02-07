# CMI_AT151 User's Guide

## 一、说明

* 准备一个 ubuntu14.04以上版本的虚拟机。
* 在普通用户下执行下面操作.
* 在此之前你要熟悉一部分 git 的操作，参考网上教程进行学习。

## 二、环境搭建

* 执行如下命令进行安装相关软件以及下载相关代码
```shell
    sudo apt-get update
    sudo apt-get install vim git
```
* 在当前用户目录下创建aplex目录，所有所有操作内容均是在该目录下操作：
```shell
    cd ~
    mkdir image aplex
    cd aplex
```
* 下载交叉编译器，并放入虚拟机的家目录下的 aplex 目录，并配置环境变量：
  * 交叉编译器下载地址为：
	* [CROSS_COMPILER](https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/arm-linux-gnueabihf/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf.tar.xz)
  * 下载完了将它放入虚拟机 ~/aplex 目录，并解压:
	```shell
        cd  ~/aplex
        tar -xvf  gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf.tar.xz
	```
  * 配置交叉编译器路径：
    ```shell
        aplex@Aplex:~/aplex$ cat ~/.bashrc
        [...省略前面无关内容]
        export PATH=~/aplex/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin:$PATH
        export ARCH=arm
        export CROSS_COMPILE=arm-linux-gnueabihf-
        aplex@Aplex:~$
    ```
  * 测试交叉编译器是否正常：
    ```shell
        aplex@Aplex:~/aplex$ source ~/.bashrc
        aplex@Aplex:~/aplex$ arm             # <---------- 这里按两次Tab键看效果
        arm2hpdl                        arm-linux-gnueabihf-gcov-tool
        arm-linux-gnueabihf-addr2line   arm-linux-gnueabihf-gdb
        arm-linux-gnueabihf-ar          arm-linux-gnueabihf-gfortran
        arm-linux-gnueabihf-as          arm-linux-gnueabihf-gprof
        arm-linux-gnueabihf-c++         arm-linux-gnueabihf-ld
        arm-linux-gnueabihf-c++filt     arm-linux-gnueabihf-ld.bfd
        arm-linux-gnueabihf-cpp         arm-linux-gnueabihf-nm
        arm-linux-gnueabihf-elfedit     arm-linux-gnueabihf-objcopy
        arm-linux-gnueabihf-g++         arm-linux-gnueabihf-objdump
        arm-linux-gnueabihf-gcc         arm-linux-gnueabihf-ranlib
        arm-linux-gnueabihf-gcc-5.3.1   arm-linux-gnueabihf-readelf
        arm-linux-gnueabihf-gcc-ar      arm-linux-gnueabihf-size
        arm-linux-gnueabihf-gcc-nm      arm-linux-gnueabihf-strings
        arm-linux-gnueabihf-gcc-ranlib  arm-linux-gnueabihf-strip
        arm-linux-gnueabihf-gcov

        aplex@Aplex:~/aplex$ arm
    ```
## 三、u-boot, kernel, rootfs  下载：
  * u-boot2016.05 源码下载：
  ```shell
	  cd ~/aplex
	  mkdir u-boot2016.05 && cd u-boot2016.05
	  git init
	  git pull http://github.com/AplexOS/U-Boot.git  CMI_AT151-Linux-Uboot-v2016.05:master
  ```
  * kernel4.4.12 源码下载：
  ```shell
	  cd ~/aplex
	  mkdir kernel4.4.12 && cd kernel4.4.12
	  git init
	  git pull http://github.com/AplexOS/Linux-Kernel.git  CMI_AT151-Linux-Kernel-v4.4.12:master
  ```
  * rootfs 源文件下载：
  ```shell
	  cd ~/aplex
	  mkdir filesytem && cd filesytem
  ```
  ```shell
	  # 下面这一段必须升级到root 用户下操作，原因是因为 rootfs 的权限问题。
	  # 升级到 root 用户的命令是 su
	  su
	  git init
	  git pull http://github.com/AplexOS/Filesystem.git CMI_AT151_LINUX4.4.12_ROOTFS:master
	  # 下载完了之后退出 root 用户，命令是 exit。
	  exit
  ```

## 四、源代码的编译，ubi 文件系统的生成：
  * u-boot2016.05 编译：
  ```shell
      cd ~/aplex/u-boot2016.05
	  make -j2 O=out  am335x_cmi_at151_defconfig all
	  cp out/MLO ~/image -rf
	  cp out/u-boot.img  ~/image -rf
	  # 已经将生成的 MLO、u-boot.img 拷贝到 ~/image 目录下
  ```
  * kernel4.4.12 编译：
  ```shell
      cd ~/aplex/kernel4.4.12
	  make  am335x_cmi_at151_defconfig
	  make all -j4
	  cp arch/arm/boot/zImage  ~/image -rf
	  cp arch/arm/boot/dts/am335x-cmi_at151.dtb  ~/image -rf
	  # 生成的 zImage am335x-cmi_at151.dtb 放在了 ~/image 下面。
  ```
  * ubi 文件系统的生成：
  ```shell
	  cd  ~/aplex/filesytem/
	  sudo apt-get install mtd-utils
	  sudo chmod 777 mkubiimg.sh  mygitfilesystem.sh  ubinize.cfg
	  ./mkubiimg.sh
	  #  生成的 ubi.img 也放在了 ~/image 下面。
  ```
## 五、由于虚拟机对 USB 的支持不是很完善，所以建议参考下面的链接进行制作 SD 卡镜像并直接进行第七步烧入步骤：
  *  [SDMakeimg](MakeSDimg.md)
## 六、SD卡的制作：
  * 将SD卡插入 Ubuntu 虚拟机中，并等待被检测生成设备节点。
  * 首先要将挂载的设备节点解除挂载并格式化：
  ```shell
      sudo umount  /media/am335x/*
	  # 这里的 am335x 是我用户名，当前环境是 ubuntu14.04
	  sudo dd if=/dev/zero of=/dev/sdb  bs=1024 count=10
	  # 在执行 格式化 SD 卡的命令
	  #  /dev/sdb 是SD卡产生的设备节点， 有可能也是 /dev/sdc /dev/sdd，但是一定不是 /dev/sda
  ```
  * 对 SD 卡设置分区：
  ```shell
	  # 带 # 的都是注释
      am335x@am335x:~$ sudo fdisk  /dev/sdb  # /dev/sdb 是SD卡设备节点
	  Device contains neither a valid DOS partition table, nor Sun, SGI or OSF disklabel
	  Building a new DOS disklabel with disk identifier 0x5c5103a7.
	  Changes will remain in memory only, until you decide to write them.
	  After that, of course, the previous content won't be recoverable.

	  Warning: invalid flag 0x0000 of partition table 4 will be corrected by w(rite)

	  Command (m for help): n		# 添加新的分区
	  Partition type:
	  p   primary (0 primary, 0 extended, 4 free)
	  e   extended
	  Select (default p): p			# 添加主分区
  	  Partition number (1-4, default 1):    # 回车确认
	  Using default value 1
	  First sector (2048-15126527, default 2048):   # 回车确认
	  Using default value 2048
	  Last sector, +sectors or +size{K,M,G} (2048-15126527, default 15126527): +100M  # 100 M 大小

	  Command (m for help): t		# 改变分区格式
	  Selected partition 1
	  Hex code (type L to list codes): e	# 改变为 FAT16 分区格式
	  Changed system type of partition 1 to e (W95 FAT16 (LBA))

	  Command (m for help): a		# 添加 boot 属性
	  Partition number (1-4): 1		# 指定 第一个分区添加 boot 属性

	  Command (m for help): p		# 打印当前分区信息
	  Disk /dev/sdb: 7744 MB, 7744782336 bytes
	  239 heads, 62 sectors/track, 1020 cylinders, total 15126528 sectors
	  Units = sectors of 1 * 512 = 512 bytes
	  Sector size (logical/physical): 512 bytes / 512 bytes
	  I/O size (minimum/optimal): 512 bytes / 512 bytes
	  Disk identifier: 0x5c5103a7

		Device Boot      Start         End      Blocks   Id  System
	  /dev/sdb1   *        2048      206847      102400    e  W95 FAT16 (LBA)

	  Command (m for help): w		# 保存退出
	  The partition table has been altered!

	  Calling ioctl() to re-read partition table.

	  WARNING: If you have created or modified any DOS 6.x
	  partitions, please see the fdisk manual page for additional
	  information.
	  Syncing disks.
	  am335x@am335x:~$
  ```
  * 对 SD 卡进行 FAT 16格式化
  ```shell
      sudo mkfs.vfat  -F 16 -n "boot" /dev/sdb1    # sdb1 表示你刚才配置的第一个分区
  ```
  * 拔出 SD 卡并重新插入， 将 ~/image 下面的所有文件拷贝到  SD 卡第一个分区内：
  ```shell
      sudo mkdir /media/am335x/sdb1 && sudo mount -t vfat /dev/sdb1 /media/am335x/sdb1
      sudo cp ~/image/*  /media/am335x/sdb1  -rf
	  sync
  ```
  * 拔出 SD 卡。
## 七、系统的烧入：
  * 将 SD 卡插入 CMI-AT151 SD 卡槽，`并拔出J1`，上电。
  * 等待1-2分钟，等到电源灯旁的LED1 不断闪烁表示烧写完毕。
  * `将J1 扣上`。
  * 上电启动，等待 LED1 闪烁即表示开机完成。
  * 注：烧写时为拔出J1，启动系统时为 J1 扣上。
## 八、启动
  * 串口登录:
	* 请参考原理图制作debug port线，1角为 VCC，2角TX，3角RX，4角GND。
    * 注： 此信号为3.3V TTL 信号，如果需要与PC连接，通常PC需要一个USB转TTL的模块才能与此连接，切不可直接连接 RS232。
    * Debug port 设置：波特率：115200，数据位：8，校验：none ， 停止位：1。
	* 登录账号：root, 密码：root。
  * Vsftpd 服务使用介绍：
	* Eth0 配置IP 192.168.1.1，Eth1 配置192.168.2.1
	* 请使用 ftp 客户端工具登录 CMI-AT151 ftp服务器。
	* 账号：root, 密码：root
  * Ssh 服务登录：
	* 如果是连接 Eth0 在windows ssh 客户端输入 192.168.1.1
	* 如果是连接 Eth1 在windows ssh 客户端输入 192.168.2.1
	* 登录账号：root, 密码：root。






