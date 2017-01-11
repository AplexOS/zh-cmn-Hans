## JSON数据传输格式说明

* 采用JSON数据格式对数据进行封装；
* 数据格式结构下：
 * `categories`字段代表分类；
 * `type`字段代表类型；
 * 后面接具体的数据；
* 示例：
 * 静态IP设置：`{"categories":"network", "type": "staticIP", "ip":ip, "netmask":netmask, "broadcast":broadcast, "gateway":gateway}`
 * 动态IP设置：`{"categories":"network", "type": "dhcp"}`
 * 测试WAN网络设置：`{"categories":"network", "type": "ping", "IPOrDNS": "www.baidu.com"}`
 * 时间设置：`{"categories":"dateAndTime", "type": "dateAndTime", "date":date, "time":time}`
* 返回值：
 * 成功返回：`{"status": "ok"}`
 * 失败返回：`{"status": "error"}`

