# Food Shelf Life Database API

This Ruby on Rails 5 application servers data as JSON from the FSIS FoodKeeper database
from the USDA. The API complies with RESTful Route GET.

The while making the API fully RESTful is really simple, for simple querying,
GET fulfills the app purpose quite well.

There are 2 versions of the API, v1 serves data as-is, and v2 serves a more
semantic developer-friendly JSON.

Use this at your own risk.

## API Routes

It is recommended to use v2 instead of v1 as the latter throws all the raw data
without any semantic formatting. If, for some reason, you need to use the raw
data, just change to the v1 in the API url.

### Categories

GET all categories

`GET http://localhost:3000/api/v2/categories`

GET a single category

`GET http://localhost:3000/api/v2/categories/:id`

### Ingredients

GET all ingredients

`GET http://localhost:3000/api/v2/ingredients`

GET a single ingredient

`GET http://localhost:3000/api/v2/ingredients/:id`


```json
{
  "id": 67,
  "name": "Goat",
  "subtitle_name": "less tender whole cuts (stew meat, riblets, shanks)",
  "category": {
    "id": 10,
    "name": "Meat",
    "subcategory": "Fresh"
  },
  "keywords": "Goat,less tender whole cuts,stew meat,stew,meat,riblets,shanks,whole cuts,tender,less tender",
  "shelf_life": {
    "dop_refrigerate": {
      "min": 3,
      "max": 5,
      "metric": "Days",
      "message": "from 3 to 5 Days"
    },
    "dop_freeze": {
      "min": 4,
      "max": 12,
      "metric": "Months",
      "message": "from 4 to 12 Months"
    }
  },
  "cooking_methods": {
    "Oven": {
      "timing": {
        "from": 20,
        "to": 30,
        "metric": "minutes",
        "per": null,
        "message": "from 20 to 30 minutes"
      },
      "measure": {
        "from": 0.5,
        "to": 1.5,
        "metric": "pounds",
        "message": "from 0.5 to 1.5 pounds"
      }
    },
    "Broil/Grill": {
      "timing": {
        "from": 20,
        "to": 20,
        "metric": "minutes",
        "per": null,
        "message": "from 20 to 20 minutes"
      },
      "measure": {
        "from": 0.5,
        "to": 1.5,
        "metric": "pounds",
        "message": "from 0.5 to 1.5 pounds"
      }
    }
  },
  "tips": {
    "storage": null,
    "cooking": {
      "recommendation": "When cooked to safe temperatures, fresh pork may still be pink inside - but it will be safe.",
      "min_temp": 145,
      "resting_time": "3 minutes"
    }
  }
}
```

## Technical Details
* Ruby version: 2.6.1

* System dependencies: Rails 5.2.3

### Database creation

`rails db:create`

### Database initialization

`rails db:migrate`

### Database Seed

`rails db:seed`


## License
MIT (c) 2019 Jose Elera for the code built on top of the Rails codebase.

The data used to populate the database is from the USDA.
