#!/bin/bash

if [ "$#" -ne 5 ]; then
  echo "Usage: $0 <output_file_path> <organization_name> <new_client_id> <new_client_secret> <new_warp_connector_token>"
  exit 1
fi

OUTPUT_FILE_PATH="$1"
ORGANIZATION_NAME="$2"
NEW_CLIENT_ID="$3"
NEW_CLIENT_SECRET="$4"
NEW_WARP_CONNECTOR_TOKEN="$5"

OUTPUT_DIR=$(dirname "$OUTPUT_FILE_PATH")
if [ ! -w "$OUTPUT_DIR" ]; then
  echo "Error: Output directory '$OUTPUT_DIR' is not writable."
  exit 1
fi

cat <<EOF > "$OUTPUT_FILE_PATH"
<dict>
  <key>organization</key>
  <string>$ORGANIZATION_NAME</string>
  <key>auth_client_id</key>
  <string>$NEW_CLIENT_ID</string>
  <key>auth_client_secret</key>
  <string>$NEW_CLIENT_SECRET</string>
  <key>warp_connector_token</key>
  <string>$NEW_WARP_CONNECTOR_TOKEN</string>
</dict>
EOF

if [ $? -eq 0 ]; then
  echo "XML file has been successfully created at '$OUTPUT_FILE_PATH'."
else
  echo "Error: Failed to create the XML file."
  exit 1
fi
