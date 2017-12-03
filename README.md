Rails[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# My final Capstone Project at GA code school - Full Stack Project

-   This is a backend application that provides APIs for the following:
    -   Authenticates users based on user credentials
    -   Provides add, update, show and delete APIs for orders
    -   Provides add, update, show and delete APIs for products
    -   Provides add, update, show and delete APIs for assignments. This is join table so that order has many products through assignments
-   These APIs are consumed by the front-end application [`KArts`](https://mayoorpatil.github.io/karts)
    -   Here is the link to the front-end application repo [`KArts Repo`](https://github.com/MayoorPatil/karts)
-   This application is built using `Ruby on Rails`
-   This is my second project using ruby on rails so any feedback is appreciated

In the near future plan is to include support for the following:

-   Add carts API generic and have one-to-one realtionship to user

If you have any feedback and/or suggestions. Please connect and share

## Contact me
[LinkedIn](http://www.linkedin.com/pub/mayoor-patil/10/8a0/338)

## Technologies and Tools Used

The following tools and technologies where used to build this application

1.  Ruby on Rails, CURL scripts
2.  GIT for code repository and version control
3.  Postgres SQL database
3.  ATOM editor
4.  This API application is deployed on Heroku for public consumption
    -   Here is the link to the [`Backend Repo`](https://github.com/MayoorPatil/mayoor-capstone-rails-api)
    -   Here is the link to the [`Backend Endpoint`](https://mayoor-capstone-rails-api.herokuapp.com/)

## Development Process

Here is how I approached the development of this application

1.  Had the requirements broken down into user stories
2.  Based on the stories I spent some time designing the `Entity Relationship Diagram - ERD` and had the high level ERD created
3.  Then I moved on to creating backend resource one at a time and tested it out writing `CRUL Scripts`
    -   Created one CRUD action at one time
4.  Once the CRUL Script testing passed I intergrated the resource with the front-end application `Favorite Books`
    -   Ensured that the front-end application was able to consume the APIs using `AJAX` calls
5.  With every little change I made i unit tested all along to minimize defects and fixes. This helped a lot as I was able to identify minor defects and fix along the way.
6.  All along I also ensured every feature was committed and pushed to the GIT repository. This was specifically helpful since I knew exactly what had changed with each feature and did not have to struggle and go through a ton of code to fix or implement any missing functionality

## Links to backend stories and ERD

[`Stories`](https://github.com/MayoorPatil/mayoor-capstone-rails-api/blob/master/public/images/Capstone-KArts-Stories.png)

[`ERD`](https://github.com/MayoorPatil/mayoor-capstone-rails-api/blob/master/public/images/Capstone-KArts-ERD.png)

## API

Scripts are included in [`scripts`](scripts/products) to test built-in actions.

### Products

| Verb   | URI Pattern     | Controller#Action  |
|--------|-----------------|--------------------|
| POST   | `/products`     | `products#create`  |
| GET    | `/products`     | `products#index`   |
| GET    | `/products/:id` | `products#show`    |
| PATCH  | `/products/:id` | `products#update`  |
| DELETE | `/products/:id` | `products#destroy` |

#### POST /products

Request:

```sh
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
```

```sh
TOKEN="BAhJIiVlMGQyNjZhNTAyOTdlMWI1YWE4M2RmZWM3ZWM2MWM1NgY6BkVG--07cff8813512c0d715faa418f2a157ab79e8cccf" sh scripts/products/create.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
	"product": {
		"id": 10,
		"description": "Test",
		"price": "19.99",
		"image_url": "https://res.cloudinary.com/dvhvgdow9/image/upload/v1511804646/Necklace_qf4tu4.jpg"
	}
}
```

#### GET /products

Request:

```sh
curl --include --request GET "http://localhost:4741/products" \
  --header "Authorization: Token token=${TOKEN}"
```

```sh
TOKEN="BAhJIiU1ZTM1YmI2NmVkMGZjYzFmZWFmOWI4YjA1MWM3YzQ4MwY6BkVG--ac3b932f392f68465aa419bdd2831f0547370009" sh scripts/products/get-products.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
	"products": [{
		"id": 1,
		"description": "Bracelet",
		"price": "19.99",
		"image_url": "http://res.cloudinary.com/dvhvgdow9/image/upload/a_0/v1511891137/IMG_1599_wryphw.jpg"
	}, {
		"id": 2,
		"description": "Necklace",
		"price": "23.99",
		"image_url": "http://res.cloudinary.com/dvhvgdow9/image/upload/c_scale,w_717/a_0/v1511891153/IMG_1603_utj3rp.jpg"
	}, {
		"id": 10,
		"description": "New Item",
		"price": "18.99",
		"image_url": "https://res.cloudinary.com/dvhvgdow9/image/upload/v1511804656/bracelet_ctd9y8.jpg"
	}]
}
```

#### GET /products/:id

Request:

```sh
curl --include --request GET "http://localhost:4741/products/${ID}" \
  --header "Authorization: Token token=${TOKEN}"
```

```sh
TOKEN="BAhJIiU1ZTM1YmI2NmVkMGZjYzFmZWFmOWI4YjA1MWM3YzQ4MwY6BkVG--ac3b932f392f68465aa419bdd2831f0547370009" ID="10" sh scripts/products/get-product.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
	"product": {
		"id": 10,
		"description": "New Item",
		"price": "28.99",
		"image_url": "https://res.cloudinary.com/dvhvgdow9/image/upload/v1511804656/bracelet_ctd9y8.jpg"
	}
}
```
#### PATCH /products/:id

Request:

```sh
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
```

```sh
TOKEN="BAhJIiU1ZTM1YmI2NmVkMGZjYzFmZWFmOWI4YjA1MWM3YzQ4MwY6BkVG--ac3b932f392f68465aa419bdd2831f0547370009" LOC="https://res.cloudinary.com/dvhvgdow9/image/upload/a_0/v1508698413/amala_gyxbo7.jpg" sh scripts/products/update.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
	"product": {
		"id": 10,
		"description": "New Item",
		"price": "28.99",
		"image_url": "https://res.cloudinary.com/dvhvgdow9/image/upload/v1511804656/bracelet_ctd9y8.jpg"
	}
}
```

#### DELETE /products/:id

Request:

```sh
curl http://localhost:4741/products/${ID} \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/products/destroy.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Orders

| Verb   | URI Pattern     | Controller#Action  |
|--------|-----------------|--------------------|
| POST   | `/orders`       | `orders#create`    |
| GET    | `/orders`       | `orders#index`     |
| GET    | `/orders/:id`   | `orders#show`      |
| PATCH  | `/orders/:id`   | `orders#update`    |
| DELETE | `/orders/:id`   | `orders#destroy`   |

#### POST /orders

Request:

```sh
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
```

```sh
TOKEN="BAhJIiVlMGQyNjZhNTAyOTdlMWI1YWE4M2RmZWM3ZWM2MWM1NgY6BkVG--07cff8813512c0d715faa418f2a157ab79e8cccf" sh scripts/orders/create.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
	"order": {
		"id": 43,
		"name": "Mayoor Patil",
		"address": "1 Mill st Dover NH",
		"email": "m@m.com",
		"phone_number": 3883399393,
		"amount": "19.99",
		"status": null,
		"assignment": [],
		"products": []
	}
}
```

#### GET /orders

Request:

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/orders"
curl "${API}${URL_PATH}/${ID}" \
--header "Authorization: Token token=$TOKEN" \
  --include \
  --request GET
```

```sh
TOKEN="BAhJIiU1ZTM1YmI2NmVkMGZjYzFmZWFmOWI4YjA1MWM3YzQ4MwY6BkVG--ac3b932f392f68465aa419bdd2831f0547370009" ID=42 sh scripts/orders/get.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
	"order": {
		"id": 42,
		"name": "sdjfsdkaskdjkas",
		"address": "sadnskdfjlajsl",
		"email": "m@m.com",
		"phone_number": 323823728,
		"amount": "19.99",
		"status": null,
		"assignment": [{
			"id": 52
		}],
		"products": [{
			"id": 1,
			"description": "Bracelet",
			"price": "19.99",
			"image_url": "http://res.cloudinary.com/dvhvgdow9/image/upload/a_0/v1511891137/IMG_1599_wryphw.jpg"
		}]
	}
}
```

### Assignments

| Verb   | URI Pattern        | Controller#Action    |
|--------|--------------------|----------------------|
| POST   | `/assignments`     | `assignments#create` |
| GET    | `/assignments`     | `assignments#index`  |
| GET    | `/assignments/:id` | `assignments#show`   |
| PATCH  | `/assignments/:id` | `assignments#update` |
| DELETE | `/assignments/:id` | `assignments#destroy`|

#### POST /assignment

Request:

```sh
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
```

```sh
sh scripts/assignments/create.sh
```
Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
	"assignment": {
		"id": 54,
		"order": {
			"id": 44,
			"name": "dsjdfkslsd",
			"address": "dvdssdjjkk",
			"email": "m@m.com",
			"phone_number": 2323232322,
			"amount": "19.99",
			"status": null
		},
		"product": {
			"id": 1,
			"description": "Bracelet",
			"price": "19.99",
			"image_url": "http://res.cloudinary.com/dvhvgdow9/image/upload/a_0/v1511891137/IMG_1599_wryphw.jpg"
		}
	}
}
```

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/auth/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/auth/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password/$ID" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
ID=1 OLDPW=hannah NEWPW=elle TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/auth/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl http://localhost:4741/sign-out/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/auth/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/users/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "bob@ava.com"
    },
    {
      "id": 1,
      "email": "ava@bob.com"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/users/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "bob@ava.com"
  }
}
```


## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
