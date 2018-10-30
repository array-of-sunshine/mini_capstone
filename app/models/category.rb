class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products

  # def products
  #   the_products = []
  #   # get the category_products associated with the category
  #   category_products.each do |cp|
  #     the_products << cp.product
  #   end
  #   the_products
  # end
end
