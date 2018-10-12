class Api::ProductsController < ApplicationController
  def everything
    @products = Product.all
    render "all_the_products.json.jbuilder"
  end
end
