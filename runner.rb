require 'unirest'

response = Unirest.get("localhost:3000/api/all_products")

p response.body

response = Unirest.get("localhost:3000/api/first_product")

p response.body

response = Unirest.get("localhost:3000/api/second_product")

p response.body
