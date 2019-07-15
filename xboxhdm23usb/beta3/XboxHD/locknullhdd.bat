@Echo off & SetLocal EnableDelayedExpansion & mode con:cols=80 lines=35 
smartctl.exe -g security /dev/sd%1

smartctl.exe -s security-null-eeprom-setpass /dev/sd%1
echo Press any key to continue

pause > nul
