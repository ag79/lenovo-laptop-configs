#!/bin/bash
# Set battery conservation mode on Lenovo Ideapad platform laptops (incl. Legion)

# conservation battery mode disable
echo 0  >  /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode 
