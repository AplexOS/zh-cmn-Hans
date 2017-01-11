# ARM-Settings User's Guide

## 一、JSON数据传输格式

通过HTTP网络协议配置、获取主板信息是通过JSON数据来进行，所以我们对JSON数据内容的格式进行了定义，请参考：[《JSON数据传输格式说明》](JSON_Protocol.md)

## 二、系统数据配置

这部分主要适用于对操作系统中的设置数据进行配置，大体如下：
  * 系统时钟矫正；
  * 网络IP设置，动态、静态IP；
  * 系统更新；

详细操作请参考：[《ARM-Settings 系统数据配置》](System_Settings.md)

## 三、用户数据配置

这部分主要是根据客户需求进行定制，样例请参考：[《ARM-Settings 获取传感器数据》](Customer_Data.md)
