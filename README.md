# Board GPIO Tool

## Preface

[BoardGpio.sh](BoardGpio.sh) just test in Ubuntu 14.04. If you have any error in other version in Ubuntu or other Released Linux version, please fix bugs by yoursef.

## Install devmem2 In Ubuntu

```
sudo apt-get install devmem2
```

## USAGE

```
usage: BoardGpio.sh [-h] -m M -i I -v V

Aplex Board Gpio Tool

optional arguments:
  -h: show this help message and exit
  -m: select input or output mode
    i: input mode
    o: output mode
  -i: GPIO index
    input mode index range: 0~3(mapping to 1~4)
    output mode index range: 0~3(mapping to 1~4)
  -v: active at output mode
    0: output 0
    1: output 1

Example: 
  ./BoardGpio.sh -h
  ./BoardGpio.sh -m o -i 0 -v 0
  ./BoardGpio.sh -m o -i 0 -v 1
  ./BoardGpio.sh -m i -i 0
```

## Test Example

```
root@desktop:~ # ./BoardGpio.sh -m o -i 0 -v 1
root@desktop:~ # ./BoardGpio.sh -m i -i 0
1
root@desktop:~ # ./BoardGpio.sh -m o -i 0 -v 0
root@desktop:~ # ./BoardGpio.sh -m i -i 0
0
root@desktop:~ # ./BoardGpio.sh -m o -i 1 -v 1
root@desktop:~ # ./BoardGpio.sh -m i -i 1
1
root@desktop:~ # ./BoardGpio.sh -m o -i 1 -v 0
root@desktop:~ # ./BoardGpio.sh -m i -i 1
0
root@desktop:~ # ./BoardGpio.sh -m o -i 2 -v 1
root@desktop:~ # ./BoardGpio.sh -m i -i 2
1
root@desktop:~ # ./BoardGpio.sh -m o -i 2 -v 0
root@desktop:~ # ./BoardGpio.sh -m i -i 2
0
root@desktop:~ # ./BoardGpio.sh -m o -i 3 -v 1
root@desktop:~ # ./BoardGpio.sh -m i -i 3
1
root@desktop:~ # ./BoardGpio.sh -m o -i 3 -v 0
root@desktop:~ # ./BoardGpio.sh -m i -i 3
0
root@desktop:~ # 
```
