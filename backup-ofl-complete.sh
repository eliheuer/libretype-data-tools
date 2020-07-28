#!/bin/bash
set -e
# This script backs up a current copy of the
# full-known OFL ecosystem when run.
#
# Someone interested in the long-term history
# and preservation of the OFL ecosystem might
# run this script once per quarter to create
# personal backups for example.
echo ""
echo "    __    ____              __"
echo "   / /   /_/ /_  ________  / /___  ______  ___"
echo "  / /   / / __ \/ ___/ _ \/ __/ / / / __ \/ _ \\"
echo " / /___/ / /_/ / /  /  __/ /_/ /_/ / /_/ /  __/"
echo "/_____/_/_.___/_/   \___/\__/\__, / .___/\___/"
echo "Data Tools: OFL Full Backup /____/_/"
echo "\n****** STARTING BACKUP OF THE FULL KNOWN OFL ECOSYSTEM ******"
echo "[INFO] Backup start time: \c"
date

# Make a backup directory with today's date.
mkdir "OFL-BACKUP-$(date +"%d-%m-%Y")"
OFLDIR="OFL-BACKUP-$(date +"%d-%m-%Y")"
echo "[TEST] Backup directory created: $OFLDIR"
cd $OFLDIR

# Use IFS to read from the CSV and download each font repo
# https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Variables
# https://en.wikipedia.org/wiki/Internal_field_separator
while IFS=, read -r col1 col2
do
    echo "\n[INFO]: Backing up typeface: $col1"
    echo "[INFO]: Downloading git repo: $col2"
    git clone $col2 > /dev/null || true
done < ../csv-data/OFL.csv
cd ..

echo "\n[INFO] Backup end time: \c"
date

echo "[INFO] Done!😃"
