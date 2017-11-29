#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/orders"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "order": {
      "name": "Map",
      "address": "1 fake st",
      "email": "m@m.com",
      "phone_number": "3185863",
      "amount": "19.99",
      "status": "open"
    }
  }'

echo
