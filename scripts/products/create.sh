#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/products"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "product": {
      "description": "Test",
      "price": 19.99,
      "image_url": "https://res.cloudinary.com/dvhvgdow9/image/upload/v1511804646/Necklace_qf4tu4.jpg"
    }
  }'

echo
