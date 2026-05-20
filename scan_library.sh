#!/bin/bash

source <(sops -d ./.env.enc)

LIBRARY_ID="$MUSIC_LIBRARY_ID"

curl -X POST "$SERVER_URL/Items/$LIBRARY_ID/Refresh" \
     -H "Content-Type: application/json" \
     -H "X-Emby-Token: $API_KEY" \
     -d "{\"UserId\": \"$USER_NAME\"}" \
     -v
