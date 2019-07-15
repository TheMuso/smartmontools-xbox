smartctl32.exe -g security /dev/sd%1

smartctl32.exe -s security-eeprom-setpass,..\eeprom.bin /dev/sd%1
