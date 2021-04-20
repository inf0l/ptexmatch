#!/bin/bash
#
# Utility to check which Audio Network files are used in Pro Tools .ptx file(s).
# Exports a csv-like file with Pro Tools session name in field one followed by
# n number of fields of music files.
#
# written by Linus Bergman
#
# The script requires ptftool by Damien Zammit @zamaudio to be in the same folder
# as this utility.
# See https://github.com/zamaudio/ptformat


TMPFILE=$(mktemp /tmp/ANW-script.XXXX)

read -e -p 'Folder to scan: ' ROOTFOLDER
read -p 'Output to file: ' OUTPUT

{
		find "$ROOTFOLDER" -type f -name '*.ptx' | grep -v Backups | egrep -e '-PG|-PR' |
		while read i; do
				echo Traversing "$i"
				printf "$i" | awk -F'/' '{print $NF}' | sed 's/.ptx//' >> "$TMPFILE"

				./ptformat/ptftool "$i"  | grep -i anw | 
						sed -E -e 's/(.*)(ANW[0-9_]+[A-Za-z0-9_-]+[a-z])(.*)/ \2/' |
						sort -u >> "$TMPFILE"
		done
}

cat $TMPFILE | sed 'H;1h;$!d;g;s/\n  */,/g' >> "$OUTPUT"
rm $TMPFILE

		

