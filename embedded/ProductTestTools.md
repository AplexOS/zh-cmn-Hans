# Embedded Product Test Tools Specification

## 文件系统标准

## eMMC设备

由于eMMC存储空间目前至少在4G，现在正在考虑要到8G的空间，完全可以满足运行Debian For ARM的存储空间的需求。所以对于这类类型的系统，后续会采用这种文件系统来运作，保证系统一致性和，因为像Ubuntu Core、Raspberry PI等等系统都是从debian那里分支出来的系统。

* [Debian For ARM](https://www.debian.org/ports/arm/)

## NAND Flash设备

由于NAND Flash设备目前最大存储空间为512MB，所以需要采用单独编译的文件系统来做，不能使用Debian For ARM来做。
* [Busybox](https://www.busybox.net/)；
* [Buildroot](https://buildroot.org/)；

## 基础硬件测试软件规范	

倾向于测试硬件基础功能，包括硬件外部扩展功能。

### Linux命令行版本

* 独立`GPIO`口测试软件；
* 独立`EEPROM`读写测试软件；
* 独立`UART`测试软件；
* ...

### Linux命令行、Qt、Android整合版本

整合`Linux`命令行版本功能，集成到一个测试`App`中。这部分后续会进一步细化，包括界面、显示内容。

### PHP Web Server标准
 
* [JavaScript jQuery框架](http://www.w3school.com.cn/jquery/)
* [CSS Bootstrap框架](http://www.runoob.com/bootstrap/bootstrap-tutorial.html)
* [PHP Smarty模板框架](http://jaceju.net/2005-06-08-getting-started-with-smarty/)
* [EmWebAdmin](https://github.com/ZengjfOS/EmWebAdmin)
* 功能：
  * 查看当前基础系统运行状态信息	
  * 静态网络参数、动态网络参数设定	
  * 时间设定	
  * 网络时间同步	
  * 烧录系统（包括文件上传）：
    * 单独更新`Bootloader`
	* 单独更新`Linux kernel`
	* 单独更新客户软件
	* 单独更新文件系统
  * 系统参数设定	
  * 硬件测试系统	
  * 客户软件参数设定	

