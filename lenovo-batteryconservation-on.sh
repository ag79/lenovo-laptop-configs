#!/bin/bash
# Set battery conservation mode on Lenovo Ideapad platform laptops (incl. Legion)

# conservation mode enable
echo 1  >  /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
