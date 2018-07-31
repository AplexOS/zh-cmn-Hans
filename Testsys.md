# CMI_AT151 测试说明

## 一、单独测试方法
* 串口测试方法
  * 串口测试方法, 假设测试 ttyO1
  * `microcom /dev/ttyO1`
  * 按键盘，看有没有数据返回
* USB 测试方法
  * 插入 U 盘
  * 执行如下命令
  * `ls /dev/sd*`
  * 看有没有出现设备节点
* RTC 测试
  * 执行如下命令
  * `hwclock -r`
  * 看有没有时间显示
* EEPROM 测试
  * 执行如下命令
  * echo 12345 > /dev/eeprom
  * cat /dev/eeprom
  * 看 会不会有 数字， 而且有一堆乱码，一般情况下
* 网口测试
  * 看是否能接上 SSH, Telnet, Vsftpd
* Watchdog 测试方法
  * 执行如下命令：
  * `echo 0 > /dev/watchdog`
  * 60S 后 会重启，表示看门狗OK。
* 热机程序测试
  * 执行如下命令
  * `/root/testcpu.sh start`
  * 执行 `top` 命令，可以看到 CPU 占用率。
  * `/root/testcpu.sh stop`
  * 结束命令
* 开关机测试
  * 开始
  * `/root/on-off.sh start`
  * 结束
  * `/root/on-off.sh stop`
