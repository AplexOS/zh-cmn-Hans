#include <stdio.h>
#include <string.h>

#define DEBUG
#ifdef DEBUG
    #define print(format, ...) printf(format"\r\n", ##__VA_ARGS__);
#else
    #define print(format, ...)
#endif

char* USB_DISK_CMD = "ls /dev/ | grep sd[b-z]";

char* LINK_STR = "Link detected: ";
char* SPEED_STR = "Speed: ";
char* ETH_LINK_STATUS = "ethtool %s 2>/dev/null | grep -E '%s|%s'";

char* USER_LOGIN = "w -h | wc -l";

void getShellCmdData(char* cmd, char* ret)
{
	FILE* fp;
	char line[128];

	fp = popen(cmd, "r");

	while(fgets(line, sizeof(line), fp)) {
		strcat(ret, line);
	}

	pclose(fp);
}

int checkETHStatus(char* eth)
{
	char cmdbuf[64];
	char buffer[128];
	char* str_index = 0;

	sprintf(cmdbuf, ETH_LINK_STATUS, eth, LINK_STR, SPEED_STR);
	getShellCmdData(cmdbuf, buffer);
	print("%s\r\n", buffer);

	str_index = strstr(buffer, LINK_STR);
	if (str_index != NULL) {
		int len = strlen(LINK_STR);
		if (strncmp(str_index + len, "yes", 3) != 0) {
			print("%s\r\n", str_index + len);
			return -1;
		}
	}

	str_index = strstr(buffer, SPEED_STR);
	if (str_index != NULL) {
		int len = strlen(SPEED_STR);
		if (strncmp(str_index + len, "1000", 4) == 0) {
			print("1000");
			return 1000;
		} else if (strncmp(str_index + len, "100", 3) == 0) {
			print("100");
			return 100;
		} else if (strncmp(str_index + len, "10", 2) == 0) {
			print("10");
			return 10;
		}
	}

	return -1;
}

int checkUSBDiskExist(void)
{
	char buffer[256];

	getShellCmdData(USB_DISK_CMD, buffer);
	print("%s\r\n", buffer);

	if (strstr(buffer, "sd") != NULL) {
		return 0;
	} else {
		return -1;
	}
}

int checkUserLogin(void)
{
	char buffer[8] = {0};

	getShellCmdData(USER_LOGIN, buffer);
	print("%s\r\n", buffer);

	if (atoi(buffer) > 0) {
		return 0;
	} else {
		return -1;
	}
}

int main(int argv, char** argc)
{
	printf("%d\r\n", checkUSBDiskExist());
	printf("%d\r\n", checkETHStatus("eth0"));
	printf("%d\r\n", checkUserLogin());
}
