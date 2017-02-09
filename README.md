`# SBC-7109S-Linux4.4.12-Qt4.8.5-BSP

## 一、BSP开发包文档说明

* 该文档面向[Aplex](http://www.aplextec.com/cn/home.php) SBC-7109S主板；
* 内核版本：Linux v4.4.12；
* GUI库版本：Qt4.8.5；

## 二、BSP开发包文档简述

当您拿到主板以及我们业务提供的BSP包，请参考[《SBC-7109S-Linux4.4.12-Qt4.8.5 Quick Start Guide》](Quick_Start_Guide.md)，您将获取以下信息：
* 主板上的主要接口；
* 如何使用编译工具，并烧录我们已经编译好的镜像；

如果您想进一步对我们主板进行开发，请参考[《SBC-7109S-Linux4.4.12-Qt4.8.5 User's Guide》](User's_Guide.md)，从该文档中，您将获取以下信息：
* 如何搭建开发环境；
* 如何编译U-Boot、Linux Kernel源代码；
* 如何使用我们提供的example-applications；
* 如何使用我们搭建好所有环境的VMware虚拟机，内置U-Boot、Linux Kernel、Qt库源代码，可直接进行二次开发。

对于Qt桌面系统的配置、修改，请参考[《SBC-7109S-Linux4.4.12-Qt4.8.5 Desktop Display System》](Desktop_Display_System.md)，您将获取以下信息：
* 桌面系统配置文件位置；
* 桌面系统如何配置及配置参考；

## 三、BSP开发包文档目录说明

关于BSP包获取方式，请与您对接的业务人员联系，并获取对应主板的BSP开发包。

```
    .
    ├── board-support                   // 板级支持
    │   ├── prebuilt-images             // 编译好的镜像及dtb.
    │   │   ├── u-boot.img              // 编译好的u-boot.img
    │   │   ├── zImage                  // 编译好的zImage
	|   |   ├── MLO                     // 编译好的MLO
	|   |   ├── uEnv.txt                // SD卡系统的配置文件
	|   |   ├── uEnv_emmc.txt           // Emmc系统的配置文件
	|   │   └── am335x-sbc7109.dtb       // 设备树编译完的二进制文件
    │   │        
    │   ├── linux-kernel-source-code    // Linux Kernel源代码
    │   ├── u-boot-source-code          // U-boot源代码
    │   ├── qt-source-code              // Qt GUI库源代码
    │   └── VMware-Workstation          // 已经配置好了所有的开发环境的VMware虚拟机
    ├── docs                            // 使用、开发文档
    │   └── README.txt                  // 内容描述指向GitHub对应的BSP文档
    ├── example-applications            // 应用程序示例
    │   └── board-demo-examples         // 主板IO Demo
    ├── filesystem                      // 文件系统
    │   └── rootfs.tar                  // 打包好的文件系统
    └── linux-devkit                    // 开发工具
        ├── compiler                    // 编译器
		└── tools                    	// 工具

```

## 四、BSP开发包使用、开发参考文档列表

* [SBC-7109S-Linux4.4.12-Qt4.8.5 Quick Start Guide.md](Quick_Start_Guide.md)；
* [SBC-7109S-Linux4.4.12-Qt4.8.5 User's Guide](User's_Guide.md)；
* [SBC-7109S-Linux4.4.12-Qt4.8.5 Desktop Display System](Desktop_Display_System.md)；

## 五、版权说明

以上所有内容最终解释权归[aplex](http://www.aplextec.com/cn/home.php)公司所有。