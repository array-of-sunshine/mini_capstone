class Api::ProductsController < ApplicationController
  def everything
    @products = Product.all
    render "all_the_products.json.jbuilder"
  end

  def first
    # get ONE product from the db
    @product = Product.first
    render "primary.json.jbuilder"
  end

  def second
    # get ONE product from the db
    @product = Product.second
    # render "primary.json.jbuilder"
    render "secondary.json.jbuilder"
  end
end
