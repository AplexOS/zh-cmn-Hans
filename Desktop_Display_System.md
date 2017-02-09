# Desktop Display System

## 一、桌面系统效果
![SBC-7109SBoardDesktop.png](img/SBC-7109SBoardDesktop.png)

## 二、配置文件说明

* 2.1 配置文件位置：`/usr/share/web/lighttpd/webpages/json.txt`
* 2.2 配置文件内容结构如下：
```
{"main_menu":{"apps":[
    {
        "Name":"Browser",
        "Order":999,
        "Icon":"apps\/images\/web-icon.png",
        "Type":"application",
        "Exec":"\/usr/share\/web\/lighttpd\/webpages\/shell\/browser.sh http://www.nxp.com",
        "ProgramType":"gui",
        "Description_Link":-1,
        "Lock":-1
    },
    {
        "Name":"Touch",
        "Order":999,
        "Icon":"apps\/images\/touch-icon.png",
        "Type":"application",
        "Exec":"\/usr/share\/web\/lighttpd\/webpages\/shell\/touch.sh",
        "ProgramType":"gui",
        "Description_Link":-1,
        "Lock":-1
    },
    {
        "Name":"Test",
        "Order":999,
        "Icon":"apps\/images\/test.png",
        "Type":"application",
        "Exec":"\/usr/share\/web\/lighttpd\/webpages\/shell\/test.sh",
        "ProgramType":"gui",
        "Description_Link":-1,"Lock":-1
    }, 
    {   
        "Name":"Performance",
        "Order":999,
        "Icon":"apps\/images\/perf.png",
        "Type":"application",
        "Exec":"\/usr/share\/web\/lighttpd\/webpages\/shell\/perf.sh",
        "ProgramType":"gui",
        "Description_Link":-1,
        "Lock":-1
    },
    {   
        "Name":"Erase",
        "Order":999,
        "Icon":"apps\/images\/erase.png",
        "Type":"application",
        "Exec":"\/usr/share\/web\/lighttpd\/webpages\/shell\/erase.sh",
        "ProgramType":"gui",
        "Description_Link":-1,
        "Lock":-1
    },
    {   
        "Name":"Delete",
        "Order":999,
        "Icon":"apps\/images\/delete.png",
        "Type":"application",
        "Exec":"\/usr/share\/web\/lighttpd\/webpages\/shell\/delete.sh",
        "ProgramType":"gui",
        "Description_Link":-1,
        "Lock":-1
    }
]}}
```
* 2.3 字段说明：
 * `Name`: 应用名
 * `Order`: 默认填`999`
 * `Icon`: 要显示的图片路径
 * `Type`: 默认填`application`
 * `Exec`: 用于执行Qt GUI程序的shell脚本，请参考[`browser.sh`](shell/browser.sh)，在文件系统的'usr/web/lighttpd/webpages/shell'中有更多参考
 * `ProgramType`: 默认填`gui`
 * `Description_Link`: 默认填`-1`
 * `Lock`: 默认填`-1`