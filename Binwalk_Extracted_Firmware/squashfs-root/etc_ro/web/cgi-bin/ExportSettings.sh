#!/bin/sh


#output HTTP header
echo "Pragma: no-cache\n"
echo "Cache-control: no-cache\n"
echo "Content-type: application/octet-stream"
echo "Content-Transfer-Encoding: binary"			#  "\n" make Un*x happy
#DATE=$(date +%Y%m%d)
echo "Content-Disposition: attachment; filename=\"AP800_$1.cfg\""
echo ""

echo "#The following line must not be removed."
echo "Default"
if [ "$2" = "acl" ]; then
ralink_init show 2860 | grep Access | grep -v "3572" 2>/dev/null
echo ""
elif [ "$2" = "acl5g" ]; then
ralink_init show 2860 | grep Access | grep "3572" 2>/dev/null
echo ""
elif [ "$2" = "radius" ]; then
ralink_init show 2860 | grep "IN_RADIUS" 2>/dev/null
echo ""
else
ralink_init show 2860 2>/dev/null
fi