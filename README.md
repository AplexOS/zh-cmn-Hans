# Relay Terminal SOP

## 一、主板接口

## 二、Switch扩展板

![switch.png](image/switch.png)

## 三、OTG系统烧录
* 工具：PC机一台、USB OTG线一条、中继器一台、24V电源一套、烧录软件；
* 步骤：
  * 下载烧录工具：[MfgTool](https://github.com/ZengjfOS/MfgToolA51)
  * 烧录工具使用请参考：[1.4 Linux3.0.35-eMMC-MX6DL-ALL.vbs：](https://github.com/ZengjfOS/MfgToolA51#14-linux3035-emmc-mx6dl-allvbs)
  * `prebuild`目录中提供已经编译、测试OK的系统，可直接用于烧录、测试；
  * 将核心板（面板）'SW1'拨码开关2号拨码拨到OFF一侧(ON的对侧)，并通过MICRO USB线连接好主板上'USB1'和PC机上的USB接口，按中继器供电要求给中继器供电。
  * 双击执行`Linux3.0.35-eMMC-MX6DL-ALL.vbs`应用程序，出现如下图界面则表示：  
    ![preburning.png](image/preburning.png)
  * 点击`start`按钮进行烧写，当出现如下图界面则表示烧写成功，点击`stop`然后点击`exit`退出程序：  
    ![burningdown.png](image/burningdown.png)
  * 关闭核心板电源，将`SW1`第2位拨码开关拨到'ON'一侧，开启电源即可开始运行系统。

## 四、查看系统信息

## 五、测试

### 5.1 GPIO测试

### 5.2 UART测试

### 5.3 Buzzer测试

### 5.4 USB设备测试

### 5.5 网络测试

### 5.6 SD卡测试

### 5.7 RTC测试

### 5.8 开关机测试

### 5.9 Touch测试

### 5.10 CPU测试
