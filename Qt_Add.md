# 添加 Qt App 到文件系统说明

## 一、使用 QT Creator 编译个 Qt 程序
```sh
  编译一个最简单的 untitled
  sudo cp untitled  ~/aplex/filesytem/rootfs_v2//usr/share/qt/bin/untitled  -rf
```

## 文件系统 QT配置文件说明：
```
#配置文件是文件系统下的 usr/share/web/lighttpd/webpages/json.txt
{"main_menu":
{"apps":
  [
  {"Name":"Browser",
    "Order":999,
    "Icon":"apps\/images\/web-icon.png",
    "Type":"application",
    "Exec":"\/usr/share\/web\/lighttpd\/webpages\/shell\/browser.sh http://processors.wiki.ti.com",
    "ProgramType":"gui",
    "Description_Link":-1,
    "Lock":-1},
  {"Name":"Touch",
    "Order":999,
    "Icon":"apps\/images\/touch-icon.png",
    "Type":"application",
    "Exec":"\/usr/share\/web\/lighttpd\/webpages\/shell\/touch.sh",
    "ProgramType":"gui",
    "Description_Link":-1,
    "Lock":-1},
  {"Name":"Test",
    "Order":999,
    "Icon":"apps\/images\/test.png",
    "Type":"application",
    "Exec":"\/usr/share\/web\/lighttpd\/webpages\/shell\/test.sh",
    "ProgramType":"gui",
    "Description_Link":-1,
    "Lock":-1},
  {"Name":"Performance",
    "Order":999,
    "Icon":"apps\/images\/perf.png",
    "Type":"application",
    "Exec":"\/usr/share\/web\/lighttpd\/webpages\/shell\/perf.sh",
    "ProgramType":"gui",
    "Description_Link":-1,
    "Lock":-1}    
  {"Name":"untitled",
      "Order":999,
      "Icon":"apps\/images\/perf.png",
      "Type":"application",
      "Exec":"\/usr/share\/web\/lighttpd\/webpages\/shell\/untitled.sh",
      "ProgramType":"gui",
      "Description_Link":-1,
      "Lock":-1}
  ]
}
}
```
```
  Name ：桌面显示的名字。
  Icon : 桌面图标的图片。
  Exec : 点击图标后要执行的脚本。
```
```
  # 看一下 shell/untitled.sh
  #!/bin/sh

  if test -e /dev/fb0; then
  width=`fbset | grep 'geometry' | awk '{print $2}'`
  height=`fbset | grep 'geometry' | awk '{print $3}'`

  let height=height-38
  geo=`echo $width\x$height+0+0`
  fi
  #export QWS_DISPLAY='Transformed:Rot90'
  if [ $? == 0 ]
  then
        /usr/share/qt/bin/untitled -geometry $geo $*
  else

  export TSLIB_TSDEVICE=/dev/input/event0
  export QWS_MOUSE_PROTO=Tslib:/dev/input/event0
        /usr/share/qt/bin/untitled -qws -geometry $geo $*
  fi
```
