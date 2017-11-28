#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/products"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "product": {
      "description": "Bracelet",
      "price": 19.99,
      "image_url": "https://res.cloudinary.com/dvhvgdow9/image/upload/v1511804656/bracelet_ctd9y8.jpg"
    }
  }'

echo
