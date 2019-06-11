smartmontools
=============

Sample usage:

smartctl -g security device

smartctl -s security-setpass,PASSWORD device

smartctl -s security-unlock,PASSWORD device

smartctl -s security-disable,PASSWORD device

smartctl -s security-eeprom-setpass,EEPROMFILENAME device

smartctl -s security-eeprom-unlock,EEPROMFILENAME device

smartctl -s security-eeprom-disable,EEPROMFILENAME device

Examples:

smartctl -g security /dev/sdf

smartctl 6.2 2013-07-26 r3841 [x86_64-linux-3.13.0-24-generic] (local build)

Copyright (C) 2002-13, Bruce Allen, Christian Franke, www.smartmontools.org

ATA Security is:  Disabled, NOT FROZEN [SEC1]

smartctl -s security /dev/sdf

smartctl 6.2 2013-07-26 r3841 [x86_64-linux-3.13.0-24-generic] (local build)
Copyright (C) 2002-13, Bruce Allen, Christian Franke, www.smartmontools.org

=======> INVALID ARGUMENT TO -s: security
=======> VALID ARGUMENTS ARE: on, off, aam,[N|off], apm,[N|off], lookahead,[on|off], 
security-freeze, security-setpass, security-disable, security-unlock, security-eeprom-setpass, security-eeprom-disable, security-eeprom-unlock, standby,[N|off|now], wcache,[on|off], rcache,[on|off], wcreorder,[on|off] <=======

Use smartctl -h to get a usage summary

smartctl -s security-eeprom-setpass,blankeeprom.bin /dev/sdf

smartctl 6.2 2013-07-26 r3841 [x86_64-linux-3.13.0-24-generic] (local build)
Copyright (C) 2002-13, Bruce Allen, Christian Franke, www.smartmontools.org

security_password=<long password>

ATA Security setpass

smartctl -g security /dev/sdf

smartctl 6.2 2013-07-26 r3841 [x86_64-linux-3.13.0-24-generic] (local build)
Copyright (C) 2002-13, Bruce Allen, Christian Franke, www.smartmontools.org

ATA Security is:  ENABLED, PW level HIGH, not locked, not frozen [SEC5]

smartctl -s security-eeprom-disable,blankeeprom.bin /dev/sdf

smartctl 6.2 2013-07-26 r3841 [x86_64-linux-3.13.0-24-generic] (local build)
Copyright (C) 2002-13, Bruce Allen, Christian Franke, www.smartmontools.org

security_password=<long password>
ATA Security disable

smartctl -g security /dev/sdf

smartctl 6.2 2013-07-26 r3841 [x86_64-linux-3.13.0-24-generic] (local build)
Copyright (C) 2002-13, Bruce Allen, Christian Franke, www.smartmontools.org

ATA Security is:  Disabled, NOT FROZEN [SEC1]

