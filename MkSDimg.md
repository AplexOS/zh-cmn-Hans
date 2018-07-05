# Ubuntu14.04 上制作 SD img 说明

## 一、说明：

* 由于虚拟机的 USB 支持不是很完善，所以可能出现 SD 卡在虚拟机分区失败的现象。
* 出现的现象为：在虚拟机内将 MLO、u-boot.img ... 拷贝到 SD 卡 boot 分区后上电烧入失败的现象。
* 所以加一篇文档说明直接在虚拟机内生成一个完整的 SD 卡镜像，然后直接在 Windows 对 SD 卡进行操作。

## 二、 在 Ubuntu14.04 虚拟机上生成 SD.img。

* 在虚拟机普通用户下执行如下命令（带 # 为注释）
* 生成一个带有 fat16 分区格式的镜像。
    ```shell
    sudo dd if=/dev/zero of=SD.img  bs=1M count=150
    /dev/loop0
    # 生成一个 100M 的镜像。
	sudo losetup -f --show SD.img
	# 会显示一个设备名，这个名称你可以看作是块设备。
	# 执行下列分区操作
	am335x@am335x:~/test$ sudo fdisk  /dev/loop0
	Device contains neither a valid DOS partition table, nor Sun, SGI or OSF disklabel
	Building a new DOS disklabel with disk identifier 0xc4488340.
	Changes will remain in memory only, until you decide to write them.
	After that, of course, the previous content wont be recoverable.

	Warning: invalid flag 0x0000 of partition table 4 will be corrected by w(rite)

	Command (m for help): n
	Partition type:
	#   primary (0 primary, 0 extended, 4 free)
	e   extended
	Select (default p): p
	Partition number (1-4, default 1): 1
	First sector (2048-204799, default 2048):
	Using default value 2048
	Last sector, +sectors or +size{K,M,G} (2048-204799, default 204799):
	Using default value 204799

	Command (m for help): t
	Selected partition 1
	Hex code (type L to list codes): e
	Changed system type of partition 1 to e (W95 FAT16 (LBA))

	Command (m for help): a
	Partition number (1-4): 1

	Command (m for help): p

	Disk /dev/loop0: 104 MB, 104857600 bytes
	255 heads, 63 sectors/track, 12 cylinders, total 204800 sectors
	Units = sectors of 1 * 512 = 512 bytes
	Sector size (logical/physical): 512 bytes / 512 bytes
	I/O size (minimum/optimal): 512 bytes / 512 bytes
	Disk identifier: 0xc4488340

		Device Boot      Start         End      Blocks   Id  System
	/dev/loop0p1   *        2048      204799      101376    e  W95 FAT16 (LBA)

	Command (m for help): w
	The partition table has been altered!

	Calling ioctl() to re-read partition table.

	WARNING: Re-reading the partition table failed with error 22: Invalid argument.
	The kernel still uses the old table. The new table will be used at
	the next reboot or after you run partprobe(8) or kpartx(8)

	WARNING: If you have created or modified any DOS 6.x
	partitions, please see the fdisk manual page for additional
	information.
	Syncing disks.
	am335x@am335x:~/test$
    ```
* 格式化这个 fat16 分区：
  ```shell
    sudo apt-get install kpartx
    sudo kpartx -av /dev/loop0
    sudo mkfs.vfat    -n "boot" -F 16  /dev/mapper/loop0p1
  ```
* 挂载这个分区并把 MLO、u-boot.img zImage am335x-cmi_at151.dtb ubi.img 拷贝进去。
    ```shell
	sudo mount /dev/mapper/loop0p1 /mnt
 	cd ~/image
	sudo cp  MLO u-boot.img zImage am335x-cmi_at101.dtb  ubi.img  /mnt -rf
	sync
	sudo umount /mnt
    ```
* 解除挂载
    ```shell
	sudo  kpartx -d /dev/loop0
	sudo  losetup -d /dev/loop0
    ···
* 再将这个镜像拷贝到 Windows

## 三、在 Windows 端对 SD 进行操作

* 下载 Wind32 Disk imager 工具
	下载地址为 [Win32 Disk Download](https://sourceforge.net/projects/win32diskimager/)
* 打开 Wind32 Disk imager，并插入 SD 卡。
    ```shell
	映像文件选择 SD.img，设备端插入 SD 自动显示。
	选择写入，不要多选其他选项。
	烧写完毕，ok，安全拔出 SD 卡。
    ```    
* 源代码编译方法请参考： [CROSS_COMPILE](CrossCompiler.md)
* 烧录启动方法请参考： [Start](QuickStart.md)
