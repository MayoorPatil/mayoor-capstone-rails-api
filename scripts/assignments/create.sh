#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/assignments"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "assignment": {
      "order_id": "2",
      "product_id": "2"
    }
  }'

echo
