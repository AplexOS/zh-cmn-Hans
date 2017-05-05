# Redmine Collaboration Work Specification

## 注册

* 使用公司邮箱注册；
* 使用账户名使用邮箱（[Your Full Name]@aplex.com.tw）中的[Your Full Name]部分；
* 密码可以自由设定；


## 使用规则范例

* **WeeklyReports项目**
  * 项目目标：用于周报汇报工作；
  * 项目管理者规则：
    * 在议题清单中创建项目，议题主旨格式：`SZ\_[your full name]\_WeeklyReports`；
    * 议题标签为：`Note`；
    * 议题属于：私有；
    * 设定议题更新需要被通知的人员；
  * 成员使用者规则：
    * 每周成员更新，议题相关设定的通知人员将会被通知，并可以查看。
* **KnowledgeManagement项目**
  * 项目目标：用于对项目积累过程中发现的问题进行文档规范化；
  * 项目管理者规则：
    * KM目录为根目录，代表的意思为：`Knowledge Management`；
    * 每块标准主板项目为一个KM下子目录，例如：
      * `SBC-7112`为`SZ`标准主板名称；
      * `SBC-7109`为`SZ`标准主板名称；
    * 标准主板衍生主板目录为对应的标准主板子目录，例如；
      * `SBC-7112-114`为`SBC-7112`衍生项目，所以为`SBC-7112`子目录；
    * 知识库的管理一定要注意权限的问题，自己写的文档可以删除，但不能删除别人写的文档，权限说明：
      * 查看文章；
      * 创建文章；
      * 管理自己的文章；
      * 创建文章分类；
      * 关注文章；
  * 成员使用者规则：
    * 鼓励成员自动更新需要编写的知识库文档；
    * 管理人员发现有些文档未更新，发起议题分配`bug`任务，成员完成后关闭`bug`任务；
* **SBC-7112**
  * 使用`i.MX6`为主控芯片的项目；
  * 由台北研发二处维护，项目名：`SBC-7112 Main board design`；
  * 深圳研发二处更多倾向于维护`SBC-7112`衍生主板。
  * 项目管理者规则：
    * 根项目命名规则：`[Mother Board Name] Main board design`。例如；`SBC-7112 Main board design`
    * 根据硬件版本创建硬件子项目：`[Mother Board Name] [Board Version]`。例如：`SBC-7112 R1.3`
      * 所有的硬件问题需要在该项目中处理。
    * 根据软件系统创建软件系统项目：`[Mother Board Name] [Software Type With Version]`。例如：`SBC-7112 Android 5.1.1`
      * 所有的硬件问题需要在该项目中处理。
    * 示例：  
    ```
    SBC-7112 Main board design
    └── SBC-7112 R1.3
        └── SBC-7112 Android 5.1.1
    ```

* **SBC-7109**
  * 使用`AM335x`为主控芯片的项目；
  * 由台北研发二处维护，项目名：`SBC-7109 R1.1`；
  * 深圳研发二处更多倾向于维护`SBC-7109`衍生主板。
  * 项目管理者规则：
    * 请参考`SBC-7112`中项目管理者规则；
