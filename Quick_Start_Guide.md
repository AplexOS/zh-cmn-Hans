* 将编译生成的u-boot.bin，uImage，rootfs.tar.bz2这3个文件拷贝到MFG_TOOL\Profiles\MX6DL Linux Update\OS Firmware\files目录下。
* 将核心板拨码开关“SW1”的第1位拨到“1”的一边，第2位拨到“KE”一边，并通过MINIUSB线连接好板子和电脑，开启核心板电源。
* 连接PC机与主板OTG线。
* 双击执行MFG_TOOL\MfgTool2.exe应用程序，出现如下界面则表示检测到CPU：
 [eviceDetect.png](images/QSDeviceDetect.png)
* 点击Start按钮进行烧写，当出现如下界面则表示烧写成功，点击Stop然后点击Exit退出程序：
* 关闭核心板电源，将拨码开关“SW1”的第2位拨码开关拨到相反位置“2”，开启电源即开始运行系统。
