# 触发控制器寄存器说明

## 一、寄存器索引

序号| 寄存器偏移 | 寄存器名称(32bit读写空间)                           |
:--:|:----------:|:------------------------------------:|
01  | 0x00       | [触发消抖延时寄存器](#21-触发消抖延时寄存器)     |
02  | 0x01       | [分频寄存器](#22-分频寄存器)     |
03  | 0x02       | [触发输入信号查询寄存器](#23-触发输入信号查询寄存器)     |
04  | 0x03       | [手动触发4寄存器](#24-手动触发4寄存器)     |
05  | 0x04       | [手动触发3寄存器](#25-手动触发3寄存器)     |
06  | 0x05       | [手动触发2寄存器](#26-手动触发2寄存器)     |
07  | 0x06       | [手动触发1寄存器](#27-手动触发1寄存器)     |
08  | 0x07       | [触发类型寄存器](#28-触发类型寄存器)     |
09  | 0x08       | [触发输出触发模式寄存器](#29-触发输出触发模式寄存器)     |
10  | 0x09       | [触发输出输入1 T1计数寄存器](#210-触发输出输入1-T1计数寄存器)     |
11  | 0x0A       | [触发输出输入1 T2计数寄存器](#211-触发输出输入1-T2计数寄存器)     |
12  | 0x0B       | [触发输出输入1 T3计数寄存器](#212-触发输出输入1-T3计数寄存器)     |
13  | 0x0C       | [触发输出输入2 T1计数寄存器](#213-触发输出输入2-T1计数寄存器)     |
14  | 0x0D       | [触发输出输入2 T2计数寄存器](#214-触发输出输入2-T2计数寄存器)     |
15  | 0x0E       | [触发输出输入2 T3计数寄存器](#215-触发输出输入2-T3计数寄存器)     |
16  | 0x0F       | [触发输出输入3 T1计数寄存器](#216-触发输出输入3-T1计数寄存器)     |
17  | 0x10       | [触发输出输入3 T2计数寄存器](#217-触发输出输入3-T2计数寄存器)     |
18  | 0x11       | [触发输出输入3 T3计数寄存器](#218-触发输出输入3-T3计数寄存器)     |
19  | 0x12       | [触发输出输入4 T1计数寄存器](#219-触发输出输入4-T1计数寄存器)     |
20  | 0x13       | [触发输出输入4 T2计数寄存器](#220-触发输出输入4-T2计数寄存器)     |
21  | 0x14       | [触发输出输入4 T3计数寄存器](#221-触发输出输入4-T3计数寄存器)     |
22  | 0x15       | [触发输出脉冲配置寄存器](#222-触发输出脉冲配置寄存器)     |
23  | 0x16       | [触发输出4脉冲1低电平计数寄存器](#223-触发输出4脉冲1低电平计数寄存器)     |
24  | 0x17       | [触发输出4脉冲1高电平计数寄存器](#224-触发输出4脉冲1高电平计数寄存器)     |
25  | 0x18       | [触发输出4脉冲2低电平计数寄存器](#225-触发输出4脉冲2低电平计数寄存器)     |
26  | 0x19       | [触发输出4脉冲2高电平计数寄存器](#226-触发输出4脉冲2高电平计数寄存器)     |
27  | 0x1A       | [触发输出4脉冲3低电平计数寄存器](#227-触发输出4脉冲3低电平计数寄存器)     |
28  | 0x1B       | [触发输出4脉冲3高电平计数寄存器](#228-触发输出4脉冲3高电平计数寄存器)     |
29  | 0x1C       | [触发输出4脉冲4低电平计数寄存器](#229-触发输出4脉冲4低电平计数寄存器)     |
30  | 0x1D       | [触发输出4脉冲4高电平计数寄存器](#230-触发输出4脉冲4高电平计数寄存器)     |
31  | 0x1E       | [触发输出3脉冲1低电平计数寄存器](#231-触发输出3脉冲1低电平计数寄存器)     |
32  | 0x1F       | [触发输出3脉冲1高电平计数寄存器](#232-触发输出3脉冲1高电平计数寄存器)     |
33  | 0x20       | [触发输出3脉冲2低电平计数寄存器](#233-触发输出3脉冲2低电平计数寄存器)     |
34  | 0x21       | [触发输出3脉冲2高电平计数寄存器](#234-触发输出3脉冲2高电平计数寄存器)     |
35  | 0x22       | [触发输出3脉冲3低电平计数寄存器](#235-触发输出3脉冲3低电平计数寄存器)     |
36  | 0x23       | [触发输出3脉冲3高电平计数寄存器](#236-触发输出3脉冲3高电平计数寄存器)     |
37  | 0x24       | [触发输出3脉冲4低电平计数寄存器](#237-触发输出3脉冲4低电平计数寄存器)     |
38  | 0x25       | [触发输出3脉冲4高电平计数寄存器](#238-触发输出3脉冲4高电平计数寄存器)     |
39  | 0x26       | [触发输出2脉冲1低电平计数寄存器](#239-触发输出2脉冲1低电平计数寄存器)     |
40  | 0x27       | [触发输出2脉冲1高电平计数寄存器](#240-触发输出2脉冲1高电平计数寄存器)     |
41  | 0x28       | [触发输出2脉冲2低电平计数寄存器](#241-触发输出2脉冲2低电平计数寄存器)     |
42  | 0x29       | [触发输出2脉冲2高电平计数寄存器](#242-触发输出2脉冲2高电平计数寄存器)     |
43  | 0x2A       | [触发输出2脉冲3低电平计数寄存器](#243-触发输出2脉冲3低电平计数寄存器)     |
44  | 0x2B       | [触发输出2脉冲3高电平计数寄存器](#244-触发输出2脉冲3高电平计数寄存器)     |
45  | 0x2C       | [触发输出2脉冲4低电平计数寄存器](#245-触发输出2脉冲4低电平计数寄存器)     |
46  | 0x2D       | [触发输出2脉冲4高电平计数寄存器](#246-触发输出2脉冲4高电平计数寄存器)     |
47  | 0x2E       | [触发输出1脉冲1低电平计数寄存器](#247-触发输出1脉冲1低电平计数寄存器)     |
48  | 0x2F       | [触发输出1脉冲1高电平计数寄存器](#248-触发输出1脉冲1高电平计数寄存器)     |
49  | 0x30       | [触发输出1脉冲2低电平计数寄存器](#249-触发输出1脉冲2低电平计数寄存器)     |
50  | 0x31       | [触发输出1脉冲2高电平计数寄存器](#250-触发输出1脉冲2高电平计数寄存器)     |
51  | 0x32       | [触发输出1脉冲3低电平计数寄存器](#251-触发输出1脉冲3低电平计数寄存器)     |
52  | 0x33       | [触发输出1脉冲3高电平计数寄存器](#252-触发输出1脉冲3高电平计数寄存器)     |
53  | 0x34       | [触发输出1脉冲4低电平计数寄存器](#253-触发输出1脉冲4低电平计数寄存器)     |
54  | 0x35       | [触发输出1脉冲4高电平计数寄存器](#254-触发输出1脉冲4高电平计数寄存器)     |
55  | 0x36       | [触发输出信号查询寄存器](#255-触发输出信号查询寄存器)     |
56  | 0x37       | [光源输出触发模式选择](#256-光源输出触发模式选择)     |
57  | 0x38       | [光源输出输入1 T1计数寄存器](#257-光源输出输入1-T1计数寄存器)     |
58  | 0x39       | [光源输出输入1 T2计数寄存器](#258-光源输出输入1-T2计数寄存器)     |
59  | 0x3A       | [光源输出输入1 T3计数寄存器](#259-光源输出输入1-T3计数寄存器)     |
60  | 0x3B       | [光源输出输入2 T1计数寄存器](#260-光源输出输入2-T1计数寄存器)     |
61  | 0x3C       | [光源输出输入2 T2计数寄存器](#261-光源输出输入2-T2计数寄存器)     |
62  | 0x3D       | [光源输出输入2 T3计数寄存器](#262-光源输出输入2-T3计数寄存器)     |
63  | 0x3E       | [光源输出输入3 T1计数寄存器](#263-光源输出输入3-T1计数寄存器)     |
64  | 0x3F       | [光源输出输入3 T2计数寄存器](#264-光源输出输入3-T2计数寄存器)     |
65  | 0x40       | [光源输出输入3 T3计数寄存器](#265-光源输出输入3-T3计数寄存器)     |
66  | 0x41       | [光源输出输入4 T1计数寄存器](#266-光源输出输入4-T1计数寄存器)     |
67  | 0x42       | [光源输出输入4 T2计数寄存器](#267-光源输出输入4-T2计数寄存器)     |
68  | 0x43       | [光源输出输入4 T3计数寄存器](#268-光源输出输入4-T3计数寄存器)     |
69  | 0x44       | [光源输出配置寄存器](#269-光源输出配置寄存器)     |
70  | 0x45       | [光源输出信号查询寄存器](#270-光源输出信号查询寄存器)     |
71  | 0x46       | [计数复位寄存器](#271-计数复位寄存器)     |
72  | 0x5A       | [GPI消抖延时寄存器](#272-GPI消抖延时寄存器)     |
73  | 0x5B       | [NPN/PNP查询寄存器](#273-NPN/PNP查询寄存器)     |
74  | 0x5C       | [GPI寄存器](#274-GPI寄存器)     |
75  | 0x5D       | [GPO寄存器](#275-GPO寄存器)     |

## 二、寄存器说明

### 2.1 触发消抖延时寄存器            

* **寄存器位分配表**

  31 : 16 | 15 : 0
  :----:|:----:
  保留  | 有效

* **寄存器说明**  
  * [15:0]：触发输入消抖寄存器，使用2MHz频率计数，低16位有效，其它位保留；
  * 默认值：`0x00`；

### 2.2 分频寄存器             

* **寄存器位分配表**

  31 : 16 | 15 : 0 
  :----:|:----:
  保留  | 有效 

* **寄存器说明**  
  * [15:0]：对2MHz频率分频，要求**大于等于2**；
  * 默认值：`0x02`；

### 2.3 触发输入信号查询寄存器

* **寄存器位分配表**

  31 : 4 | 3 : 0
  :----:|:----:
  保留  | 有效

* **寄存器说明**  
  * [3:0]：触发输入信号状态查询寄存器，通过该寄存器可以查询到当前触发输入信号状态，`4bit`对应四触发输入；
  * 默认值：`0x00`；

### 2.4 手动触发4寄存器    

* **寄存器位分配表**

  31 : 1 | 0
  :----:|:----:
  保留  | 有效

* **寄存器说明**  
  * [0]：手动触发状态下，模拟触发输入4信号寄存器。`0`：低电平；`1`：高电平；
  * 默认值：`0x00`；

### 2.5 手动触发3寄存器   

* **寄存器位分配表**

  31 : 1 | 0
  :----:|:----:
  保留  | 有效

* **寄存器说明**  
  * [0]：手动触发状态下，模拟触发输入3信号寄存器。`0`：低电平；`1`：高电平；
  * 默认值：`0x00`；

### 2.6 手动触发2寄存器  

* **寄存器位分配表**

  31 : 1 | 0
  :----:|:----:
  保留  | 有效

* **寄存器说明**  
  * [0]：手动触发状态下，模拟触发输入2信号寄存器。`0`：低电平；`1`：高电平；
  * 默认值：`0x00`；

### 2.7 手动触发1寄存器 

* **寄存器位分配表**

  31 : 1 | 0
  :----:|:----:
  保留  | 有效

* **寄存器说明**  
  * [0]：手动触发状态下，模拟触发输入1信号寄存器。`0`：低电平；`1`：高电平；
  * 默认值：`0x00`；

### 2.8 触发类型寄存器                

* **寄存器位分配表**

  31 | 30 | 29 | 28 | |
  :----:|:----:|:----:|:----:|:----:
  触发输出触发输入4 | 触发输出触发输入3 | 触发输出触发输入2 | 触发输出触发输入1 | |
  27 | 26 | 25 | 24 | 23:0 |
  光源输出触发输入4 | 光源输出触发输入3 | 光源输出触发输入2 | 光源输出触发输入1 | 保留

* **寄存器说明** 
  * [31:28]：四路触发输出输入对应的`4bit`，手动触发与外部触发选择信号：
    * `0`：手动触发
    * `1`：外部触发输入触发
  * [27:24]：四路光源输出输入对应的`4bit`，手动触发与外部触发选择信号：
    * 同上
  * 默认值：`0x00`；

### 2.9 触发输出触发模式寄存器        

* **寄存器位分配表**

  31:29 | 28:26 | 25:23 | 22:20 | 19:0 
  :----:|:----:|:----:|:----:|:----:
  触发输出触发输入4 | 触发输出触发输入3 | 触发输出触发输入2 | 触发输出触发输入1 | 保留

* **寄存器说明** 
  * [31:29]：触发逻辑4的触发模式选择信号，六种触发模式：
    * `0x01`：Rising edge（上升沿触发）
    * `0x02`：Falling edge（下降沿触发）
    * `0x03`：High Level（高电平持续触发）
    * `0x04`：Low Level（低电平持续触发）
    * `0x05`：Adjustable number of rising edges（上升沿可调次数触发）
    * `0x06`：Adjustable number of falling edges（下降沿可调次数触发）
  * [28:26]：触发逻辑3的触发模式选择信号，六种触发模式
    * 同上
  * [25:23]：触发逻辑2的触发模式选择信号，六种触发模式
    * 同上
  * [22:20]：触发逻辑1的触发模式选择信号，六种触发模式
    * 同上
  * 默认值：`0x00`；

### 2.10 触发输出输入1 T1计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出输入1 T1计数器；
  * 默认值：`0x00`；

### 2.11 触发输出输入1 T2计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出输入1 T2计数器；
  * 默认值：`0x00`；

### 2.12 触发输出输入1 T3计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出输入1 T3计数器，在可调次数模式下，T3为次数；
  * 默认值：`0x00`；

### 2.13 触发输出输入2 T1计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出输入2 T1计数器；
  * 默认值：`0x00`；

### 2.14 触发输出输入2 T2计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出输入2 T2计数器；
  * 默认值：`0x00`；

### 2.15 触发输出输入2 T3计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出输入2 T3计数器，在可调次数模式下，T3为次数；
  * 默认值：`0x00`；

### 2.16 触发输出输入3 T1计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出输入3 T1计数器；
  * 默认值：`0x00`；

### 2.17 触发输出输入3 T2计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出输入3 T2计数器；
  * 默认值：`0x00`；

### 2.18 触发输出输入3 T3计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出输入3 T3计数器，在可调次数模式下，T3为次数；
  * 默认值：`0x00`；

### 2.19 触发输出输入4 T1计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出输入4 T1计数器；
  * 默认值：`0x00`；

### 2.20 触发输出输入4 T2计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出输入4 T2计数器；
  * 默认值：`0x00`；

### 2.21 触发输出输入4 T3计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出输入4 T3计数器，在可调次数模式下，T3为次数；
  * 默认值：`0x00`；

### 2.22 触发输出脉冲配置寄存器        

* **寄存器位分配表**

  31:30 | 29:28 | 27:26 | 25:24 ||
  :----:|:----:|:----:|:----:|:----:
  触发输出4脉冲源|触发输出3脉冲源|触发输出2脉冲源|触发输出1脉冲源||
  23:20 | 19:16 | 15:12 | 11:8 ||
  脉冲4输出使能 | 脉冲3输出使能 | 脉冲2输出使能 | 脉冲1输出使能 ||
  7     | 6     | 5     | 4    |3:0|
  触发输出4使能|触发输出3使能|触发输出2使能|触发输出1使能|保留|

* **寄存器说明** 
  * [31:30]：第4路脉冲发生器输入源选择信号，取值：`0 ~ 4`对应的内部触发源；
  * [29:28]：第3路脉冲发生器输入源选择信号，取值同上；
  * [27:26]：第2路脉冲发生器输入源选择信号，取值同上；
  * [25:24]：第1路脉冲发生器输入源选择信号，取值同上；
  * [23:20]：第4路脉冲发生器输出的与门使能信号，取值：`0x0 ~ 0xF`，每路一个`bit`位，`1` 表示选通；
  * [19:16]：第3路脉冲发生器输出的与门使能信号，取值同上；
  * [15:12]：第2路脉冲发生器输出的与门使能信号，取值同上；
  * [11:8]：第1路脉冲发生器输出的与门使能信号，取值同上；
  * [7]：触发输出4使能输出信号，`1` 表示选通；
  * [6]：触发输出3使能输出信号，`1` 表示选通；
  * [5]：触发输出2使能输出信号，`1` 表示选通；
  * [4]：触发输出1使能输出信号，`1` 表示选通；
  * 默认值：`0x00`；

### 2.23 触发输出4脉冲1低电平计数寄存器

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出4 脉冲1低电平计数；
  * 默认值：`0x00`；

### 2.24 触发输出4脉冲1高电平计数寄存器

* **寄存器位分配表**

  31:16| 15:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [16:0]：触发输出4 脉冲1高电平计数；
  * 默认值：`0x00`；

### 2.25 触发输出4脉冲2低电平计数寄存器

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出4 脉冲2低电平计数；
  * 默认值：`0x00`；

### 2.26 触发输出4脉冲2高电平计数寄存器

* **寄存器位分配表**

  31:16| 15:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [16:0]：触发输出4 脉冲2高电平计数；
  * 默认值：`0x00`；

### 2.27 触发输出4脉冲3低电平计数寄存器

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出4 脉冲3低电平计数；
  * 默认值：`0x00`；

### 2.28 触发输出4脉冲3高电平计数寄存器

* **寄存器位分配表**

  31:16| 15:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [16:0]：触发输出4 脉冲3高电平计数；
  * 默认值：`0x00`；

### 2.29 触发输出4脉冲4低电平计数寄存器

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出4 脉冲4低电平计数；
  * 默认值：`0x00`；

### 2.30 触发输出4脉冲4高电平计数寄存器

* **寄存器位分配表**

  31:16| 15:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [16:0]：触发输出4 脉冲4高电平计数；
  * 默认值：`0x00`；

### 2.31 触发输出3脉冲1低电平计数寄存器

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出3 脉冲1低电平计数；
  * 默认值：`0x00`；

### 2.32 触发输出3脉冲1高电平计数寄存器

* **寄存器位分配表**

  31:16| 15:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [16:0]：触发输出3 脉冲1高电平计数；
  * 默认值：`0x00`；

### 2.33 触发输出3脉冲2低电平计数寄存器

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出3 脉冲2低电平计数；
  * 默认值：`0x00`；

### 2.34 触发输出3脉冲2高电平计数寄存器

* **寄存器位分配表**

  31:16| 15:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [16:0]：触发输出3 脉冲2高电平计数；
  * 默认值：`0x00`；

### 2.35 触发输出3脉冲3低电平计数寄存器

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出3 脉冲3低电平计数；
  * 默认值：`0x00`；

### 2.36 触发输出3脉冲3高电平计数寄存器

* **寄存器位分配表**

  31:16| 15:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [16:0]：触发输出3 脉冲3高电平计数；
  * 默认值：`0x00`；

### 2.37 触发输出3脉冲4低电平计数寄存器

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出3 脉冲4低电平计数；
  * 默认值：`0x00`；

### 2.38 触发输出3脉冲4高电平计数寄存器

* **寄存器位分配表**

  31:16| 15:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [16:0]：触发输出3 脉冲4高电平计数；
  * 默认值：`0x00`；

### 2.39 触发输出2脉冲1低电平计数寄存器

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出2 脉冲1低电平计数；
  * 默认值：`0x00`；

### 2.40 触发输出2脉冲1高电平计数寄存器

* **寄存器位分配表**

  31:16| 15:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [16:0]：触发输出2 脉冲1高电平计数；
  * 默认值：`0x00`；

### 2.41 触发输出2脉冲2低电平计数寄存器

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出2 脉冲2低电平计数；
  * 默认值：`0x00`；

### 2.42 触发输出2脉冲2高电平计数寄存器

* **寄存器位分配表**

  31:16| 15:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [16:0]：触发输出2 脉冲2高电平计数；
  * 默认值：`0x00`；

### 2.43 触发输出2脉冲3低电平计数寄存器

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出2 脉冲3低电平计数；
  * 默认值：`0x00`；

### 2.44 触发输出2脉冲3高电平计数寄存器

* **寄存器位分配表**

  31:16| 15:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [16:0]：触发输出2 脉冲3高电平计数；
  * 默认值：`0x00`；

### 2.45 触发输出2脉冲4低电平计数寄存器

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出2 脉冲4低电平计数；
  * 默认值：`0x00`；

### 2.46 触发输出2脉冲4高电平计数寄存器

* **寄存器位分配表**

  31:16| 15:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [16:0]：触发输出2 脉冲4高电平计数；
  * 默认值：`0x00`；

### 2.47 触发输出1脉冲1低电平计数寄存器

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出1 脉冲1低电平计数；
  * 默认值：`0x00`；

### 2.48 触发输出1脉冲1高电平计数寄存器

* **寄存器位分配表**

  31:16| 15:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [16:0]：触发输出1 脉冲1高电平计数；
  * 默认值：`0x00`；

### 2.49 触发输出1脉冲2低电平计数寄存器

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出1 脉冲2低电平计数；
  * 默认值：`0x00`；

### 2.50 触发输出1脉冲2高电平计数寄存器

* **寄存器位分配表**

  31:16| 15:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [16:0]：触发输出1 脉冲2高电平计数；
  * 默认值：`0x00`；

### 2.51 触发输出1脉冲3低电平计数寄存器

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出1 脉冲3低电平计数；
  * 默认值：`0x00`；

### 2.52 触发输出1脉冲3高电平计数寄存器

* **寄存器位分配表**

  31:16| 15:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [16:0]：触发输出1 脉冲3高电平计数；
  * 默认值：`0x00`；

### 2.53 触发输出1脉冲4低电平计数寄存器

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：触发输出1 脉冲4低电平计数；
  * 默认值：`0x00`；

### 2.54 触发输出1脉冲4高电平计数寄存器

* **寄存器位分配表**

  31:16| 15:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [16:0]：触发输出1 脉冲4高电平计数；
  * 默认值：`0x00`；

### 2.55 触发输出信号查询寄存器        

* **寄存器位分配表**

  31:4| 3:0 
  :----:| :----:
  保留| 有效 

* **寄存器说明** 
  * [3:0]：触发输出信号状态查询寄存器，通过该寄存器可以查询到当前触发输出信号状态，`4bit`对应四触发输出；
  * 默认值：`0x00`；

### 2.56 光源输出触发模式选择          

* **寄存器位分配表**

  31:29 | 28:26 | 25:23 | 22:20 | 19:0 
  :----:|:----:|:----:|:----:|:----:
  触发输出触发输入4 | 触发输出触发输入3 | 触发输出触发输入2 | 触发输出触发输入1 | 保留

* **寄存器说明** 
  * [31:29]：触发逻辑4的触发模式选择信号，六种触发模式：
    * `0x01`：Rising edge（上升沿触发）
    * `0x02`：Falling edge（下降沿触发）
    * `0x03`：High Level（高电平持续触发）
    * `0x04`：Low Level（低电平持续触发）
    * `0x05`：Adjustable number of rising edges（上升沿可调次数触发）
    * `0x06`：Adjustable number of falling edges（下降沿可调次数触发）
  * [28:26]：触发逻辑3的触发模式选择信号，六种触发模式
    * 同上
  * [25:23]：触发逻辑2的触发模式选择信号，六种触发模式
    * 同上
  * [22:20]：触发逻辑1的触发模式选择信号，六种触发模式
    * 同上
  * 默认值：`0x00`；

### 2.57 光源输出输入1 T1计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：光源输出输入1 T1计数器；
  * 默认值：`0x00`；

### 2.58 光源输出输入1 T2计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：光源输出输入1 T2计数器；
  * 默认值：`0x00`；

### 2.59 光源输出输入1 T3计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：光源输出输入1 T3计数器；
  * 默认值：`0x00`；

### 2.60 光源输出输入2 T1计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：光源输出输入2 T1计数器；
  * 默认值：`0x00`；

### 2.61 光源输出输入2 T2计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：光源输出输入2 T2计数器；
  * 默认值：`0x00`；

### 2.62 光源输出输入2 T3计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：光源输出输入2 T3计数器；
  * 默认值：`0x00`；

### 2.63 光源输出输入3 T1计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：光源输出输入3 T1计数器；
  * 默认值：`0x00`；

### 2.64 光源输出输入3 T2计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：光源输出输入3 T2计数器；
  * 默认值：`0x00`；

### 2.65 光源输出输入3 T3计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：光源输出输入3 T3计数器；
  * 默认值：`0x00`；

### 2.66 光源输出输入4 T1计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：光源输出输入4 T1计数器；
  * 默认值：`0x00`；

### 2.67 光源输出输入4 T2计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：光源输出输入4 T2计数器；
  * 默认值：`0x00`；

### 2.68 光源输出输入4 T3计数寄存器    

* **寄存器位分配表**

  | 31:0 
  | :----:
  | 有效 

* **寄存器说明** 
  * [31:0]：光源输出输入4 T3计数器；
  * 默认值：`0x00`；

### 2.69 光源输出配置寄存器            
  31:30 | 29:28 | 27:26 | 25:24 ||
  :----:|:----:|:----:|:----:|:----:
  光源输出4输入源|光源输出3输入源|光源输出2输入源|光源输出1输入源||
  23:22 | 21:20 | 19:18 | 17:16 ||
  同相反相4输入源 | 同相反相3输入源 | 同相反相2输入源 | 同相反相1输入源 ||
  15:14 | 13:12 | 11:10 | 9:8 ||
  脉冲4输出使能 | 脉冲3输出使能 | 脉冲2输出使能 | 脉冲1输出使能 ||
  7     | 6     | 5     | 4    |3:0|
  触发输出4使能|触发输出3使能|触发输出2使能|触发输出1使能|保留|

* **寄存器说明** 
  * [31:30]：第4路光源输出输入源选择信号，取值：`0 ~ 4`对应的内部触发源；
  * [29:28]：第3路光源输出输入源选择信号，取值同上；
  * [27:26]：第2路光源输出输入源选择信号，取值同上；
  * [25:24]：第1路光源输出输入源选择信号，取值同上；
  * [23:22]：第4路同相反相输入源选择信号，取值：`0 ~ 4`对应的触发输入源；
  * [21:20]：第3路同相反相输入源选择信号，取值同上；
  * [19:18]：第2路同相反相输入源选择信号，取值同上；
  * [17:16]：第1路同相反相输入源选择信号，取值同上；
  * [15:14]：光源输出4的输出功能选择信号
    * `0x00`：Manual trigger（手动触发输出）
    * `0x01`：External trigger（外部触发输出）
    * `0x02`：Non-inverting output（同相输出）
    * `0x03`：Inverting output（反相输出）
  * [13:12]：光源输出3的输出功能选择信号
    * 同上
  * [11:10]：光源输出2的输出功能选择信号
    * 同上
  * [9:8]：光源输出1的输出功能选择信号
    * 同上
  * [7]：光源输出4使能信号，`1` 表示选通
  * [6]：光源输出3使能信号，`1` 表示选通
  * [5]：光源输出2使能信号，`1` 表示选通
  * [4]：光源输出1使能信号，`1` 表示选通
  * 默认值：`0x00`；

### 2.70 光源输出信号查询寄存器        

* **寄存器位分配表**

  31 : 4 | 3 : 0
  :----:|:----:
  保留  | 有效

* **寄存器说明**  
  * [3:0]：光源输出信号状态查询寄存器，通过该寄存器可以查询到当前光源输出信号状态，`4bit`对应四光源输出；
  * 默认值：`0x00`；

### 2.71 计数复位寄存器                

* **寄存器位分配表**

  31 : 1 | 0
  :----:|:----:
  保留  | 有效

* **寄存器说明**  
  * [0]：对计数暂存器进行复位清零，便于配置之后重新开始计数处理；
  * 默认值：`0x00`；

### 2.72 GPI消抖延时寄存器             

* **寄存器位分配表**

  31 : 16 | 15 : 0
  :----:|:----:
  保留  | 有效

* **寄存器说明**  
  * [15:0]：触发输入消抖寄存器，使用2MHz频率计数，低16位有效，其它位保留；
  * 默认值：`0x00`；

### 2.73 NPN/PNP查询寄存器             

* **寄存器位分配表**

  31 : 3 | 2 | 1 | 0
  :----:|:----:|:----:|:----:
  保留  | 软件NPN/PNP | 软件、硬件PNP选择| 硬件NPN/PNP

* **寄存器说明**  
  * [0]：当前硬件选择`NPN/PNP`状态
    * `0`：`NPN`
    * `1`：`PNP`
  * [1]：软件、硬件`PNP`选择
    * `0`：选择硬件`NPN/PNP`
    * `1`：选择软件`NPN/PNP`
  * [2]：当前硬件选择`NPN/PNP`状态
    * `0`：`NPN`
    * `1`：`PNP`

### 2.74 GPI寄存器                     

* **寄存器位分配表**

  31 : 8 | 7:0
  :----:|:----:
  保留  | 有效

* **寄存器说明**  
  * [7:0]：8路GPI当前状态，`1`：表示有效；
  * 默认值：`0x00`；

### 2.75 GPO寄存器                     

* **寄存器位分配表**

  31 : 8 | 7:0
  :----:|:----:
  保留  | 有效

* **寄存器说明**  
  * [7:0]：8路GPO当前状态，`1`：表示有效；
  * 默认值：`0x00`；