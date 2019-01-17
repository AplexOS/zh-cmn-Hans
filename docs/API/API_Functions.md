# 设备访问函数说明

序号| 函数名称 | 中文描述 |
:--:|:----------:|:------------------------------------:|
01  | OpenPCIeDeviceInterface  | [打开PCIe设备](#11-打开PCIe设备) |
02  | ClosePCIeDeviceInterface | [关闭PCIe设备](#12-关闭PCIe设备) |
03  | PCIeI2CWriteAD5141Byte   | [写入亮度等级](#21-写入亮度等级) |
04  | PCIeI2CReadAD5141Byte    | [读取亮度等级](#22-读取亮度等级) |
05  | PCIeSetOutput            | [写GPO操作](#31-写GPO操作) |
06  | PCIeGetOutput            | [读GPO操作](#32-读GPO操作) |
07  | PCIeGetIntput            | [读GPI操作](#33-读GPI操作) |
08  | PCIeGetTrigger           | [读取触发控制器寄存器](#41-读取触发控制器寄存器) |
09  | PCIeSetTrigger           | [写入触发控制器寄存器](#42-写入触发控制器寄存器) |


## 一、打开关闭PCIe设备函数

### 1.1 打开PCIe设备

```C
INT32 OpenPCIeDeviceInterface(UINT32 workMode);
```

**参数说明**

* `workMode`: 请设置值为2；

**返回值说明**

* `0`: 打开设备正常；
* 非 `0`: 打开设备异常；

### 1.2 关闭PCIe设备

```C
INT32 ClosePCIeDeviceInterface();
```

**返回值说明**

* `0`: 关闭设备正常；
* 非 `0`: 关闭设备异常；

### 二、光源亮度等级函数

### 2.1 写入亮度等级

```C
INT32 PCIeI2CWriteAD5141Byte(UINT32 index, UINT32 val);
```

**参数说明**

* `index`: 光源索引，取值范围 `0 ~ 3`整数，对应四路光源；
* `val`: 光源亮度等级，取值范围 `0 ~ 255`整数；

**返回值说明**

* `0`: 操作设备正常；
* 非 `0`: 操作设备异常；

### 2.2 读取亮度等级

```C
INT32 PCIeI2CReadAD5141Byte(UINT32 index, UINT32[] val);
```

**参数说明**

* `index`: 光源索引，取值范围 `0 ~ 3`整数，对应四路光源；
* `val`: 数组长度请采用1，获取当前光源索引的亮度等级，取值范围 `0 ~ 255`整数；

**返回值说明**

* `0`: 操作设备正常；
* 非 `0`: 操作设备异常；

## 三、GPIO操作函数

### 3.1 写GPO操作

```C
INT32 PCIeSetOutput(UINT32 val);
```

**参数说明**

* `val`: 低`8bit`有效，一个`bit`表示一个GPO口；

**返回值说明**

* `0`: 操作设备正常；
* 非 `0`: 操作设备异常；

### 3.2 读GPO操作

```C
INT32 PCIeGetOutput(UINT32[] val);
```

**参数说明**

* `val`: 数组长度请采用1，低`8bit`有效，一个`bit`表示一个GPO口；

**返回值说明**

* `0`: 操作设备正常；
* 非 `0`: 操作设备异常；

### 3.3 读GPI操作

```C
INT32 PCIeGetIntput(UINT32[] val);
```

**参数说明**

* `val`: 数组长度请采用1，低`8bit`有效，一个`bit`表示一个GPI口；

**返回值说明**

* `0`: 操作设备正常；
* 非 `0`: 操作设备异常；

### 四、触发控制器寄存器操作函数

### 4.1 读取触发控制器寄存器

```C
INT32 PCIeGetTrigger(UINT32[] offset, UINT32[] val, UINT32 len);
```

**参数说明**

* `offset`: 触发控制器寄存器偏移数组，寄存器说明请参考：[《触发控制器寄存器说明》](API_REGs.md)；
* `val`: 与`offset`偏移数组中值对应的值数组，读取寄存器的值保存在这个数组中；
* `len`: 当前要操作的寄存器数组长度；

**返回值说明**

* `0`: 操作设备正常；
* 非 `0`: 操作设备异常；

### 4.2 写入触发控制器寄存器

```C
INT32 PCIeSetTrigger(UINT32[] offset, UINT32[] val, UINT32 len);
```

**参数说明**

* `offset`: 触发控制器寄存器偏移数组，寄存器说明请参考：[《触发控制器寄存器说明》](API_REGs.md)；
* `val`: 与`offset`偏移数组中值对应的值数组，写入寄存器的值保存在这个数组中；
* `len`: 当前要操作的寄存器数组长度；

**返回值说明**

* `0`: 操作设备正常；
* 非 `0`: 操作设备异常；
