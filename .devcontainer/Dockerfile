#!/bin/bash

echo "Starting post-create script..."

SSH_KEY_PATH="$HOME/.ssh/id_ed25519.pub"
SSH_KEY_TITLE="Master_Key"

# Generate SSH key if it does not exist
if [ ! -f "${SSH_KEY_PATH}" ]; then
  echo "SSH key not found at ${SSH_KEY_PATH}, generating a new one..."
  ssh-keygen -t ed25519 -C "your@mail.com" -f $HOME/.ssh/id_ed25519 -N ""
fi

# Read the public SSH key from the file
SSH_KEY=$(cat "${SSH_KEY_PATH}")

# JSON-Format for the API request
JSON_DATA=$(jq -n \
                  --arg key "$SSH_KEY" \
                  --arg title "$SSH_KEY_TITLE" \
                  '{"title": $title, "key": $key}')

# Debug output for the JSON data
echo "JSON Data being sent to GitHub: $JSON_DATA"

# API-Request for GitHub including the token
RESPONSE=$(curl -s -w "\n%{http_code}" -X POST -H "Authorization: token $GITHUB_TOKEN" \
     -H "Accept: application/vnd.github.v3+json" \
     -d "$JSON_DATA" \
     "https://api.github.com/user/keys")

HTTP_STATUS=$(echo "$RESPONSE" | tail -n1)
RESPONSE_BODY=$(echo "$RESPONSE" | sed '$d')

# Debug output for the response
echo "Response body: $RESPONSE_BODY"
echo "HTTP status code: $HTTP_STATUS"

if [ "$HTTP_STATUS" -eq 201 ]; then
  echo "SSH key successfully added to GitHub."
elif [ "$HTTP_STATUS" -eq 422 ]; then
  echo "Failed to add SSH key to GitHub. The key might already exist or there might be another issue."
else
  echo "Failed to add SSH key to GitHub. HTTP response code: $HTTP_STATUS"
fi

# Keep the container running for inspection
echo "Post-create script finished. Container will keep running..."
tail -f /dev/null
