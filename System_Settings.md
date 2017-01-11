# ARM-Settings 系统数据配置

如果你现在将要开始阅读、使用该部分内容，我们将假定你已经对网站开发、[jQuery](https://jquery.com/)有一定的了解。

* Ajax设置动态获取IP，详情请查看[examples/setDHCPConfigure.html](examples/setDHCPConfigure.html)

```javascript
    function setDHCPConfigure()
    {
        ajaxPostData = {"categories":"network", "type": "dhcp"};

        $.ajax({
            url: "http://192.168.1.202/settings.php",   // 修改成目标设备的IP
            type: 'POST',
            data: JSON.stringify(ajaxPostData),
            dataType:'json',
            success: function(data){
                //On ajax success do this
                console.info("success.");
                if (data["status"] == "ok"){
                    alert("Settings is Ok. The Machine is rebooting.");
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                //On error do this
                console.info("error.");
                if (xhr.status == 200) {
        
                    alert(ajaxOptions);
                }
                else {
                    alert(xhr.status);
                    alert(thrownError);
                }
            }
        });
    }
```

* Ajax设置静态IP，详情请查看[examples/setStaticIPConfigure.html](examples/setStaticIPConfigure.html)

```javascript
    function setStaticIPConfigure()
    {
        ip = "192.168.1.202";
        netmask = "255.255.254.0";
        broadcast = "0.0.0.0";
        gateway = "192.168.1.254";
        ajaxPostData = {"categories":"network", "type": "staticIP", "ip":ip, "netmask":netmask, "broadcast":broadcast, "gateway":gateway}

        $.ajax({
            url: "http://192.168.1.202/settings.php",    // 修改成目标设备的IP
            type: 'POST',
            data: JSON.stringify(ajaxPostData),
            dataType:'json',
            success: function(data){
                //On ajax success do this
                console.info("success.");
                if (data["status"] == "ok"){
                    alert("Settings is Ok. The Machine is rebooting.");
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                //On error do this
                console.info("error.");
                if (xhr.status == 200) {
                    alert(ajaxOptions);
                }
                else {
                    alert(xhr.status);
                    alert(thrownError);
                }
            }
        });
    }
```

* Ajax设置Ping公网，详情请查看[examples/pingNetwork.html](examples/pingNetwork.html)

```javascript
    function pingNetWork()
    {
        ajaxPostData = {"categories":"network", "type": "ping", "IPOrDNS": "www.baidu.com"}; // IPOrDNS这部分修改称目标IP或者DNS

        $.ajax({
            url: "http://192.168.1.202/settings.php",            // 修改成目标设备的IP
            type: 'POST',
            data: JSON.stringify(ajaxPostData),
            dataType:'json',
            success: function(data){
                //On ajax success do this
                console.info("success.");
                if (data["status"] == "ok"){
                    alert("Ping to WAN is OK.");
                } else {
                    alert("Ping to WAN is ERROR.");
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                //On error do this
                console.info("error.");
                if (xhr.status == 200) {
        
                    alert(ajaxOptions);
                }
                else {
                    alert(xhr.status);
                    alert(thrownError);
                }
            }
        });
    }
```

* Ajax更新设备日期、时间，详情请查看[examples/setDataAndTime.html](examples/setDataAndTime.html)

```javascript
    function setDataAndTime()
    {
        date = "2016-12-12";
        time = "12:12"
        
        ajaxPostData = {"categories":"dateAndTime", "type": "dateAndTime", "date":date, "time":time};

        $.ajax({
            url: "http://192.168.1.202/settings.php",            // 修改成目标设备的IP
            type: 'POST',
            data: JSON.stringify(ajaxPostData),
            dataType:'json',
            success: function(data){
                //On ajax success do this
                console.info("success.");
                if (data["status"] == "ok"){
                    alert("Data and Time Set is Ok.");
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                //On error do this
                console.info("error.");
                if (xhr.status == 200) {
                    alert(ajaxOptions);
                }
                else {
                    alert(xhr.status);
                    alert(thrownError);
                }
            }
        });
    }
```

