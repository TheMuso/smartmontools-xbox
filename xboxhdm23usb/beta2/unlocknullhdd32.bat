smartctl32.exe -g security /dev/sd%1

smartctl32.exe -s security-null-eeprom-unlock /dev/sd%1

smartctl32.exe -s security-null-eeprom-disable /dev/sd%1
