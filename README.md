# Check System Info

## Function Description

### Check Ethernet Link status

`int checkETHStatus(char* eth)`

* The argument `eth` is NIC name as `eth0`.
* Return:
  * `-1`: No link;
  * `10`: link with 10Mb/s;
  * `100`: link with 100Mb/s;
  * `1000`: link with 1000Mb/s;

### Check USB Disk Plugin

`int checkUSBDiskExist(void)`

* Return:
  * `-1`: No Exist;
  * `0`: Exist;

### Check Has User Login

`int checkUserLogin(void)`

* Return:
  * `-1`: No User Login;
  * `0`: Has User Login;
