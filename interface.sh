#!/bin/bash

echo "Date Range Overlap Checker CLI"

read -p "Range 1 Start (YYYY-MM-DDTHH:MM:SSZ): " range1_start
read -p "Range 1 End (YYYY-MM-DDTHH:MM:SSZ): " range1_end
read -p "Range 2 Start (YYYY-MM-DDTHH:MM:SSZ): " range2_start
read -p "Range 2 End (YYYY-MM-DDTHH:MM:SSZ): " range2_end

# Convert date strings to ISO 8601 format
range1_start_iso=$(date -jf "%Y-%m-%dT%H:%M:%SZ" "$range1_start" "+%Y-%m-%dT%H:%M:%SZ")
range1_end_iso=$(date -jf "%Y-%m-%dT%H:%M:%SZ" "$range1_end" "+%Y-%m-%dT%H:%M:%SZ")
range2_start_iso=$(date -jf "%Y-%m-%dT%H:%M:%SZ" "$range2_start" "+%Y-%m-%dT%H:%M:%SZ")
range2_end_iso=$(date -jf "%Y-%m-%dT%H:%M:%SZ" "$range2_end" "+%Y-%m-%dT%H:%M:%SZ")

# Construct JSON data
data='{
  "range1": {
    "start": "'"$range1_start_iso"'",
    "end": "'"$range1_end_iso"'"
  },
  "range2": {
    "start": "'"$range2_start_iso"'",
    "end": "'"$range2_end_iso"'"
  }
}'

# Send the POST request
curl -X POST -H "Content-Type: application/json" -d "$data" http://localhost:8080/overlap


# Please enter below as inppiut & check the results


# Date Range Overlap Checker CLI
# Range 1 Start (YYYY-MM-DDTHH:MM:SSZ): 2024-01-21T12:00:00Z
# Range 1 End (YYYY-MM-DDTHH:MM:SSZ): 2024-01-21T18:00:00Z
# Range 2 Start (YYYY-MM-DDTHH:MM:SSZ): 2024-01-21T15:00:00Z
# Range 2 End (YYYY-MM-DDTHH:MM:SSZ): 2024-01-21T20:00:00Z