#!/bin/bash

# 
# 1. gpio memory address: 
#   SOC_GPIOs_4 Address:	0xfed0c000 + 0x2200
#   SOC_GPIOs_5 Address:	0xfed0c000 + 0x2220
#   SOC_GPIOs_6 Address:	0xfed0c000 + 0x2240
#   SOC_GPIOs_8 Address:	0xfed0c000 + 0x2260
#   SOC_GPIOs_9 Address:	0xfed0c000 + 0x2250
#   SOC_GPIOs_10 Address:	0xfed0c000 + 0x2120
#   SOC_GPIOs_17 Address:	0xfed0c000 + 0x20A0
#   SOC_GPIOs_26 Address:	0xfed0c000 + 0x2160
# 2. Function with Signal Name Mapping
#  +------------+-------------+---------+-------------+------------+
#  |  Function  | Signal Name |  Pin#   | Signal Name |  Function  |
#  |------------+-------------+----+----+-------------+------------+
#  | SOC_GPIO10 |  GPIO_IN2   |  4 | 3  |   GPIO_IN1  | SOC_GPIO09 |
#  | SOC_GPIO26 |  GPIO_IN4   |  6 | 5  |   GPIO_IN3  | SOC_GPIO17 |
#  | SOC_GPIO05 |  GPIO_OUT2  |  8 | 7  |   GPIO_OUT1 | SOC_GPIO04 |
#  | SOC_GPIO08 |  GPIO_OUT4  | 10 | 9  |   GPIO_OUT3 | SOC_GPIO06 |
#  +------------+-------------+----+----+-------------+------------+
# 

# debug=true
debug=false

GPIO_BASE_ADDRESS=0xfed0c000
GPIO_SIGNAL_INPUT_OFFSET=(
0x2250 
0x2120 
0x20A0 
0x2160
)
GPIO_SIGNAL_OUTPUT_OFFSET=(
0x2200 
0x2220 
0x2240 
0x2260
)

GPIO_SIGNAL_INPUT_ENABLE=(
0x2003cc80
0x2003cc80
0x2003CD01
0x2003cc80
)
GPIO_SIGNAL_OUTPUT_ENABLE=(
0x2003cc80
0x2003cc80
0x2003cc80
0x2003cc80
)

gpio_mode=""
gpio_value=-1
gpio_index=-1

help(){
    echo "usage: BoardGpio.sh [-h] -m M -i I -v V"
    echo ""
    echo "Aplex Board Gpio Tool"
    echo ""
    echo "optional arguments:"
    echo "  -h: show this help message and exit"
    echo "  -m: select input or output mode"
    echo "    i: input mode"
    echo "    o: output mode"
    echo "  -i: GPIO index"
    echo "    input mode index range: 0~3(mapping to 1~4)"
    echo "    output mode index range: 0~3(mapping to 1~4)"
    echo "  -v: active at output mode"
    echo "    0: output 0"
    echo "    1: output 1"
    echo ""
    echo "Example: "
    echo "  ./BoardGpio.sh -h"
    echo "  ./BoardGpio.sh -m o -i 0 -v 0"
    echo "  ./BoardGpio.sh -m o -i 0 -v 1"
    echo "  ./BoardGpio.sh -m i -i 0"
    echo ""
    
    exit 0
}

DEBUG(){
    if $debug; then
        echo $1
    fi
}

args=$(getopt -o "m:v:i:h" -- "$@")

eval set -- "$args"

while [ $# -ge 1 ]; do
    case "$1" in

        --)
            shift
            break
            ;;
        -m)
            gpio_mode=$2
            shift 
            ;;
        -i)
            gpio_index=$2
            shift 
            ;;
        -v)
            gpio_value=$2
            shift 
            ;;
        -h | *)
            help
            ;;
    esac

    shift
done

DEBUG "gpio_mode: $gpio_mode, gpio_index: $gpio_index, gpio_value: $gpio_value."

if [ $gpio_mode = "" ] || [ $gpio_index -eq -1 ]; then
    help
fi

if [ $gpio_mode = "o" ] && [ $gpio_value -eq -1 ]; then
    help
fi

case "$gpio_mode" in

    o)
        DEBUG "In Output MODE."
        gpio_address=`printf 0x%X $(($GPIO_BASE_ADDRESS + ${GPIO_SIGNAL_OUTPUT_OFFSET[$gpio_index]}))`
        gpio_register_value=`printf 0x%X $(($gpio_value + 0x04))`                   # ref: image/PAD_VAL_Register.png
        DEBUG "$gpio_address: $gpio_register_value"
        sudo devmem2 $gpio_address w ${GPIO_SIGNAL_OUTPUT_ENABLE[$gpio_index]}      # enable gpio
        sudo devmem2 $gpio_address w $gpio_register_value                           # set gpio value
        
        ;;
    i)
        DEBUG "In Input MOde."
        gpio_address=`printf 0x%X $(($GPIO_BASE_ADDRESS + ${GPIO_SIGNAL_INPUT_OFFSET[$gpio_index]}))`
        sudo devmem2 $gpio_address w ${GPIO_SIGNAL_INPUT_ENABLE[$gpio_index]}       # enable gpio
        sudo devmem2 $gpio_address w 0x3                                            # set gpio input(ref: image/PAD_VAL_Register.png)
        ret_val=`sudo devmem2 $gpio_address`                                        # read value register. if external pull high, it will return 0x3
        DEBUG "$gpio_address: $ret_val"

        echo $(($ret_val & 0x1))
        ;;
esac

exit 0
