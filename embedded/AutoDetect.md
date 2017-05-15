# Embedded Auto Detect Work Specification

## 局域网检测线程通信协议说明：

* UDP接收端口号：5000；
* UDP发送端口号：5001；
* 通信数据采用JSON数据格式；
* 通信数据JSON字段内容（在数据传输中不需要的字段可以省略）：
  * protocol：JSON数据格式协议版本，不同的客户可以根据这个字段来区分；
  * device_id：设备的编号，从配置文件中获取，数值类型；
  * mac：设备的MAC地址，冒号分割，字符串类型；
  * ip：本机IP，点分十进制，字符串类型。

## 局域网检测线程通信流程：

* 嵌入式设备作为UDP Server端，PC机设备作为UDP Client端；
* 嵌入式设备首先建立UDP Server，等待PC机UDP Client发送UDP包；
* PC机发送UDP网络广播，JSON数据中至少包含PC机自己的IP地址信息；
* 嵌入式设备获取UDP包，获取PC机IP信息；
* 嵌入式设备将本机信息合成JSON数据，根据收到的IP地址，发送UDP包给对应PC机；
* 等待下一次PC机发送UDP获取信息。

## 编码规范：

* 嵌入式设备提供两种语言版本：
  * C/C++；
  * Python3；
* PC机检测软件：
  * C#； 
* 所有代码以四个空格替代tab键；
* 所有代码所以四个空格缩进。
* 函数、变量命名请采用有意义的命名方式，不要随意命名。
