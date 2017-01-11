# ARM-Settings 获取传感器数据

如果你现在将要开始阅读、使用该部分内容，我们将假定你已经对网站开发、[jQuery](https://jquery.com/)有一定的了解。

* Ajax获取传感器数据，详情请查看[examples/getSensorData.html](examples/getSensorData.html)

```javascript
    function getSensorDate(){
        var uri = "http://192.168.1.202/sensordata.php?data="+new Date().getTime(); // 注意修改为目标设备IP
        $.get(uri, function(data){
            //alert(data);
            //把json字符串解析成json对象;
            var jsonData = JSON.parse(data);
            var code = jsonData['code'];
            var mysqlData = jsonData['data'];
            if(code == 200){
                console.info(mysqlData);
            }
        });
    }
```
