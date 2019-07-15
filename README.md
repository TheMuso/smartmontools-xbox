# smartmontools for the original XBox

This repository contains a fork of smartmontools (https://www.smartmontools.org) with support added for working with ATA hard drive security. Support has also been added for locking and unlocking hard drives for use in the original XBox console. Making use of this support requires either a dumped EEPROM from the XBox console, or an XBox console with an EEPROM with the HD key set to all zeroes (0).

This code was originally developed by [ldotsfan](https://github.com/ldotsfan), and was cloned from https://git.code.sf.net/p/xboxhdm2/smartmontools-sec.git (also found on his github page), and updated to the latest smartmontools release, version 7.0.

Binary releases are for Windows only at this time, but the code should be buildable on any recent Linux distribution. More information can be found on the smartmontools website, or in the [README](https://github.com/TheMuso/smartmontools-xbox/blob/xbox-eeprom-7.0/smartmontools/README) file found in the smartmontools directory of this repository.

## Sample usage:

smartctl -g security device

smartctl -s security-setpass,PASSWORD device

smartctl -s security-unlock,PASSWORD device

smartctl -s security-disable,PASSWORD device

smartctl -s security-eeprom-setpass,EEPROMFILENAME device

smartctl -s security-eeprom-unlock,EEPROMFILENAME device

smartctl -s security-eeprom-disable,EEPROMFILENAME device

smartctl -s security-null-eeprom-setpass device

smartctl -s security-null-eeprom-unlock device

smartctl -s security-null-eeprom-disable device
