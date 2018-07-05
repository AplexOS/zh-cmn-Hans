# CMI_AT752 快速启动文档
* 请参考[CrossCompiler](CrossCompiler.md)进行镜像编译。
* 请参考[MkSDimg](MkSDimg.md) 制作 SD 。

## 一、软件的烧写
* debug 原理图如下：
  ![debug](img/IMG_DEBUG.png)
* 此处为 3.3V TTL 信号。
* 一般 PC 是通过 USB 串口模块转换过来.
* 设置 波特率 115200， 数据位 8， 检验位 none, 停止位 1.
* 烧录软件时，先将 CMI_AT752 的 JP1 取下。
* 插入 SD 卡，上电。
* 当 debug 出现如下信息时候，表示烧录系统完毕。
   ![burn](img/IMG_BURNSYS.jpg)

## 二、系统启动
* 扣上 JP1。
* 重新上电。
* debug 有如下信息提示:
  ![startsys](img/IMG_STARTSYS.jpg)
* 登录用户： root
* 登录密码： root
* 这个系统如果没有配合IMI101一起使用的话，会有信息循环提示。

## 三、使用 Telnet, ssh 登录 CMI_AT752
* 通过网线接入 ETH0 网口。
* SSH 登录如下：
  * 登录 IP : `192.168.1.1`
  * 账号 : `root`  密码：`root`
  ![ssh_login](img/ssh_login.jpg)
  ![ssh_loing_in](img/ssh_login_in.png)
* Telnet 登录如下：
  * 登录 IP : `192.168.1.1`
  * 账号 : `root`  密码：`root`
  ![Telnet_login_in](img/telnet_login_in.png)
  ![Telnet_login](img/telnet_login.png)
* Vsftp 登录如下:
  * 直接打开 Windows 的文件浏览器，在地址栏输入 ftp://192.168.1.1
  * 用户: `root`   密码： `root`
  ![Vsftp_login](img/vsftp_login.png)
  * 可以直接传输文件。
