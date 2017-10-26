# BIOS GPIO 分析：

## 分析目标

X86 Bay Trail-I ScC GPIO 26号引脚地址为什么是: 0xfed0c000 + 2160

参考文档：

* [gpio: add Intel BayTrail gpio driver](https://lwn.net/Articles/552203/)
* [我的内核学习笔记10：Intel GPIO驱动源码分析](http://www.latelee.org/embedded-linux/kernel-note-10-intel-gpio-driver.html)

## BIOS分析

* GPIO组别：
  * 第一组：GPIO_CONF_PAD_INIT mNB_BB_FAB2_GpioInitData_SC[]；
  * 第二组：GPIO_CONF_PAD_INIT mNB_BB_FAB2_GpioInitData_NC[]；
  * 第三组：GPIO_CONF_PAD_INIT mNB_BB_FAB2_GpioInitData_SUS[]；
  * https://github.com/tianocore/edk2/blob/18b00c8c8773e62b1e2c4a36f490996325570b67/Vlv2TbltDevicePkg/Library/MultiPlatformLib/BoardGpios/BoardGpios.h
* GPIOS_26地址转换计算：
  * `GPIO_INIT_ITEM("GPIO_DFX4         GPIOS_26 "     ,GPO      ,NA           ,F0           ,             ,                ,20K_L      ,0x16)`
  * SOC_GPIOs_26 Address:	`0xfed0c000 + 2160 = 0xfed0c000 + 0x2000 + 0x16 << 4`
* PIN脚映射：
    ```
       GPIO_CONF_PAD_INIT mNB_BB_FAB2_GpioInitData_SUS[] = {
       //              Pad Name          GPIO Number     Used As   GPIO Default  Function#     INT Capable   Interrupt Type   PULL H/L    MMIO Offset
           GPIO_INIT_ITEM("GPIO_SUS0         GPIO_SUS0"     ,GPI      ,NA           ,F0           ,YES          ,Level_High      ,20K_H      ,0x1d),
           GPIO_INIT_ITEM("GPIO_SUS1         GPIO_SUS1"     ,Native   ,NA           ,F6           ,YES          ,                ,20K_L      ,0x21),
           GPIO_INIT_ITEM("GPIO_SUS2         GPIO_SUS2"     ,Native   ,NA           ,F6           ,YES          ,Edge_Low        ,20K_H      ,0x1e),
           GPIO_INIT_ITEM("GPIO_SUS3         GPIO_SUS3"     ,GPI      ,NA           ,F0           ,YES          ,                ,20K_H      ,0x1f),
           GPIO_INIT_ITEM("GPIO_SUS4         GPIO_SUS4"     ,GPI      ,NA           ,F0           ,YES          ,Edge_High       ,20K_L      ,0x20),
           GPIO_INIT_ITEM("GPIO_SUS5         GPIO_SUS5"     ,Native   ,NA           ,F1           ,             ,                ,20K_L      ,0x22),
           GPIO_INIT_ITEM("GPIO_SUS6         GPIO_SUS6"     ,GPI      ,NA           ,F0           ,YES          ,                ,20K_L      ,0x24),
           GPIO_INIT_ITEM("GPIO_SUS7         GPIO_SUS7"     ,GPI      ,NA           ,F0           ,             ,                ,20K_L      ,0x23),
           GPIO_INIT_ITEM("SEC_GPIO_SUS8     GPIO_SUS8"     ,GPO      ,NA           ,F0           ,             ,                ,20K_L      ,0x26),
           GPIO_INIT_ITEM("SEC_GPIO_SUS9     GPIO_SUS9"     ,GPO      ,NA           ,F0           ,             ,                ,20K_L      ,0x25),
           GPIO_INIT_ITEM("SEC_GPIO_SUS10    GPIO_SUS10"    ,GPI      ,NA           ,F0           ,YES          ,Level_High      ,20K_H      ,0x12),
           GPIO_INIT_ITEM("SUSPWRDNACK       GPIOS_11 "     ,Native   ,NA           ,F0           ,             ,                ,20K_L      ,0x07),
           GPIO_INIT_ITEM("PMU_SUSCLK        GPIOS_12 "     ,Native   ,NA           ,F0           ,YES          ,                ,20K_L      ,0x0b),
           GPIO_INIT_ITEM("PMU_SLP_S0IX_B    GPIOS_13 "     ,Native   ,NA           ,F0           ,             ,                ,20K_L      ,0x14),
           GPIO_INIT_ITEM("PMU_SLP_LAN_B     GPIOS_14 "     ,GPO      ,NA           ,F1           ,             ,                ,20K_H      ,0x11),
           GPIO_INIT_ITEM("PMU_WAKE_B        GPIOS_15 "     ,Native   ,NA           ,F0           ,YES          ,Level_High      ,20K_H      ,0x01),
           GPIO_INIT_ITEM("PMU_PWRBTN_B      GPIOS_16 "     ,Native   ,NA           ,F0           ,YES          ,                ,20K_H      ,0x08),
           GPIO_INIT_ITEM("PMU_WAKE_LAN_B    GPIOS_17 "     ,Native   ,NA           ,F0           ,YES          ,Level_High      ,20K_H      ,0x0a),
           GPIO_INIT_ITEM("SUS_STAT_B        GPIOS_18 "     ,Native   ,NA           ,F0           ,YES          ,                ,20K_L      ,0x13),
           GPIO_INIT_ITEM("USB_OC0_B         GPIOS_19 "     ,Native   ,NA           ,F0           ,YES          ,                ,20K_H      ,0x0c),
           GPIO_INIT_ITEM("USB_OC1_B         GPIOS_20 "     ,Native   ,NA           ,F0           ,             ,                ,20K_H      ,0x00),
           GPIO_INIT_ITEM("SPI_CS1_B         GPIOS_21 "     ,GPO      ,NA           ,F1           ,             ,                ,20K_L      ,0x02),
           GPIO_INIT_ITEM("GPIO_DFX0         GPIOS_22 "     ,GPO      ,NA           ,F0           ,YES          ,Level_Low       ,20K_H      ,0x17),
           GPIO_INIT_ITEM("GPIO_DFX1         GPIOS_23 "     ,GPIO     ,NA           ,F0           ,YES          ,Level_Low       ,20K_L      ,0x27),
           GPIO_INIT_ITEM("GPIO_DFX2         GPIOS_24 "     ,GPIO     ,NA           ,F0           ,YES          ,Level_Low       ,20K_L      ,0x1c),
           GPIO_INIT_ITEM("GPIO_DFX3         GPIOS_25 "     ,GPIO     ,NA           ,F0           ,YES          ,                ,20K_L      ,0x1b),
           GPIO_INIT_ITEM("GPIO_DFX4         GPIOS_26 "     ,GPO      ,NA           ,F0           ,             ,                ,20K_L      ,0x16),
           GPIO_INIT_ITEM("GPIO_DFX5         GPIOS_27 "     ,GPI      ,NA           ,F0           ,YES          ,Edge_Both       ,20K_H      ,0x15),
           GPIO_INIT_ITEM("GPIO_DFX6         GPIOS_28 "     ,GPO      ,NA           ,F0           ,             ,                ,20K_L      ,0x18),
           GPIO_INIT_ITEM("GPIO_DFX7         GPIOS_29 "     ,GPO      ,NA           ,F0           ,             ,                ,20K_L      ,0x19),
           GPIO_INIT_ITEM("GPIO_DFX8         GPIOS_30 "     ,GPO      ,NA           ,F0           ,             ,                ,20K_L      ,0x1a),
           GPIO_INIT_ITEM("USB_ULPI_0_CLK    GPIOS_31 "     ,GPI      ,NA           ,F0           ,             ,                ,20K_L      ,0x33),
           GPIO_INIT_ITEM("USB_ULPI_0_DATA0  GPIOS_32 "     ,GPI      ,NA           ,F0           ,             ,                ,20K_L      ,0x38),
           GPIO_INIT_ITEM("USB_ULPI_0_DATA1  GPIOS_33 "     ,GPO      ,NA           ,F0           ,             ,                ,20K_L      ,0x36),
           GPIO_INIT_ITEM("USB_ULPI_0_DATA2  GPIOS_34 "     ,GPI      ,NA           ,F0           ,             ,                ,20K_L      ,0x31),
           GPIO_INIT_ITEM("USB_ULPI_0_DATA3  GPIOS_35 "     ,GPI      ,NA           ,F0           ,             ,                ,20K_L      ,0x37),
           GPIO_INIT_ITEM("USB_ULPI_0_DATA4  GPIOS_36 "     ,GPI      ,NA           ,F0           ,             ,                ,20K_L      ,0x30),
           GPIO_INIT_ITEM("USB_ULPI_0_DATA5  GPIOS_37 "     ,GPI      ,NA           ,F0           ,             ,                ,20K_L      ,0x39),
           GPIO_INIT_ITEM("USB_ULPI_0_DATA6  GPIOS_38 "     ,GPI      ,NA           ,F0           ,             ,                ,20K_L      ,0x32),
           GPIO_INIT_ITEM("USB_ULPI_0_DATA7  GPIOS_39 "     ,GPI      ,NA           ,F0           ,             ,                ,20K_L      ,0x3a),
           GPIO_INIT_ITEM("USB_ULPI_0_DIR    GPIOS_40 "     ,GPI      ,NA           ,F0           ,             ,                ,20K_H      ,0x34),
           GPIO_INIT_ITEM("USB_ULPI_0_NXT    GPIOS_41 "     ,GPO      ,NA           ,F0           ,             ,                ,20K_H      ,0x35),
           GPIO_INIT_ITEM("USB_ULPI_0_STP    GPIOS_42 "     ,GPI      ,NA           ,F0           ,             ,                ,20K_H      ,0x3b),
           GPIO_INIT_ITEM("USB_ULPI_0_REFCLK GPIOS_43 "     ,GPI      ,NA           ,F0           ,             ,                ,20K_L      ,0x28),
       };
    ```
* GPIO_CONF_PAD_INIT
  * PlatformInfo.h: http://www.bluestop.org/edk2/docs/trunk/_platform_info_8h_source.html
    ```
        ...
        //
        // GPIO CONF & PAD Initialization Data Structure for BayLake GPIOs bits.
        // NC = NCORE, SC = SCORE, SS= SSUS
        //
        typedef struct {
        
        #ifdef EFI_DEBUG
          char         pad_name[32];// GPIO Pin Name for debug purpose
        #endif
        
          GPIO_USAGE     usage;     // GPIO pin used as Native mode or GPI/GPO/GPIO mode
          GPO_D4         gpod4;     // GPO default value
          GPIO_FUNC_NUM  func;      // Function Number (F0~F7)
          INT_TYPE       int_type;  // Edge or Level trigger, low or high active
          PULL_TYPE      pull;      // Pull Up or Down
          UINT8          offset;    // Equal with (PCONF0 register offset >> 4 bits)
        } GPIO_CONF_PAD_INIT;
    
        ...
        #ifdef EFI_DEBUG
            #define GPIO_INIT_ITEM(pad_name, usage, gpod4, func, int_cap, int_type, pull, offset) {pad_name, usage, gpod4, func, /*int_cap,*/ TRIG_##int_type, P_##pull, offset}
        #else
            #define GPIO_INIT_ITEM(pad_name, usage, gpod4, func, int_cap, int_type, pull, offset) {          usage, gpod4, func, /*int_cap,*/ TRIG_##int_type, P_##pull, offset}
        #endif
        ...
    ```
* mMinnow2_GpioInitData_SC
  * https://github.com/tianocore/edk2/blob/18b00c8c8773e62b1e2c4a36f490996325570b67/Vlv2TbltDevicePkg/Library/MultiPlatformLib/BoardGpios/BoardGpios.c
    ```
    //
    // Config SC/NC/SUS GPIO Pins
    //
    switch (PlatformInfoHob->BoardId) {
      case BOARD_ID_MINNOW2:
      case BOARD_ID_MINNOW2_TURBOT:
        DEBUG ((EFI_D_INFO, "Start to config Minnow2 GPIO pins\n"));
        InternalGpioConfig(GPIO_SCORE_OFFSET, sizeof(mMinnow2_GpioInitData_SC)/sizeof(mMinnow2_GpioInitData_SC[0]),   (GPIO_CONF_PAD_INIT *) (UINTN) PlatformInfoHob->PlatformGpioData_SC);
        InternalGpioConfig(GPIO_NCORE_OFFSET, sizeof(mMinnow2_GpioInitData_NC)/sizeof(mMinnow2_GpioInitData_NC[0]),   (GPIO_CONF_PAD_INIT *) (UINTN) PlatformInfoHob->PlatformGpioData_NC);
        InternalGpioConfig(GPIO_SSUS_OFFSET,  sizeof(mMinnow2_GpioInitData_SUS)/sizeof(mMinnow2_GpioInitData_SUS[0]), (GPIO_CONF_PAD_INIT *) (UINTN) PlatformInfoHob->PlatformGpioData_SUS);
        break;
      default:
    
        break;
    }

    //
    // configure the CFIO Pnp settings
    //
    if (PlatformInfoHob->CfioEnabled) {
      if (PlatformInfoHob->BoardId == BOARD_ID_MINNOW2 || PlatformInfoHob->BoardId == BOARD_ID_MINNOW2_TURBOT){
        InternalGpioConfig(GPIO_SCORE_OFFSET, sizeof(mNB_BB_FAB3_GpioInitData_SC_TRI)/sizeof(mNB_BB_FAB3_GpioInitData_SC_TRI[0]), (GPIO_CONF_PAD_INIT *) (UINTN)PlatformInfoHob->PlatformGpioData_SC_TRI);
      }
    }
    ```
* GPIO_SCORE_OFFSET、GPIO_NCORE_OFFSET、GPIO_SSUS_OFFSET
  * https://github.com/tianocore/edk2/blob/18b00c8c8773e62b1e2c4a36f490996325570b67/Vlv2DeviceRefCodePkg/ValleyView2Soc/NorthCluster/Include/PlatformBaseAddresses.h
    ```
    //
    // GPIO GROUP OFFSET
    //
    #define GPIO_SCORE_OFFSET                 0x0000
    #define GPIO_NCORE_OFFSET                 0x1000
    #define GPIO_SSUS_OFFSET                  0x2000
    ```
* IO_BASE_ADDRESS
  * https://github.com/tianocore/edk2/blob/18b00c8c8773e62b1e2c4a36f490996325570b67/Vlv2DeviceRefCodePkg/ValleyView2Soc/NorthCluster/Include/PlatformBaseAddresses.h
    ```
    #define SMBM_BASE_ADDRESS                 0xFED04000 // SMBus Memory Base Address
    #define IO_BASE_ADDRESS                   0xFED0C000 // IO Memory Base Address (这个地址是固定的，所有的X86的系统都是这个)
    #define ILB_BASE_ADDRESS                  0xFED08000 // ILB Memory Base Address
    ```
* R_PCH_CFIO_PAD_CONF0
  * https://github.com/tianocore/edk2/blob/18b00c8c8773e62b1e2c4a36f490996325570b67/Vlv2DeviceRefCodePkg/ValleyView2Soc/SouthCluster/Include/PchRegs/PchRegsPcu.h
    ```
    //
    // IO Memory Space Registers (IOBASE)
    //
    #define R_PCH_CFIO_PAD_CONF0                      0x00  // CFIO PAD_CONF0
    #define R_PCH_CFIO_PAD_CONF1                      0x04  // CFIO PAD_CONF1
    #define R_PCH_CFIO_PAD_VAL                        0x08  // CFIO PAD_VAL
    #define R_PCH_CFIO_PAD_DFT                        0x0C  // CFIO PAD_CFT
    ```   

