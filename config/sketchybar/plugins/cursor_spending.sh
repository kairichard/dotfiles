#!/bin/bash

# Get the current month and year
MONTH=$(date +%m)
YEAR=$(date +%Y)

# Convert month to integer (remove leading zero if present)
MONTH=$((10#$MONTH))

# Path to the SQLite database
DB_PATH="/Users/kai/Library/Application Support/Cursor/User/globalStorage/state.vscdb"

# Check if database exists
if [ ! -f "$DB_PATH" ]; then
  sketchybar --set $NAME drawing=off
  exit 0
fi

# Get the access token
TOKEN=$(sqlite3 "$DB_PATH" "SELECT value FROM ItemTable WHERE key = 'cursorAuth/accessToken'" 2>/dev/null | tr -d '"')

if [ -z "$TOKEN" ]; then
  sketchybar --set $NAME drawing=off
  exit 0
fi

# Make the API request using curl
RESPONSE=$(curl -s -X POST "https://www.cursor.com/api/dashboard/get-monthly-invoice" \
  -H "Content-Type: application/json" \
  -H "Cookie: WorkosCursorSessionToken=${TOKEN}" \
  -d "{\"month\":${MONTH},\"year\":${YEAR},\"includeUsageEvents\":false}")

# Extract and sum up the cents values
TOTAL_CENTS=$(echo "$RESPONSE" | grep -o '"cents":[0-9]*' | cut -d':' -f2 | awk '{s+=$1} END {print s}')

# Convert to dollars and update sketchybar
if [ -n "$TOTAL_CENTS" ] && [ "$TOTAL_CENTS" -gt 0 ]; then
  DOLLARS=$(echo "scale=2; $TOTAL_CENTS/100" | bc)
  sketchybar --set $NAME \
    icon="💰" \
    label="\$$DOLLARS" \
    drawing=on
else
  sketchybar --set $NAME drawing=off
fi

