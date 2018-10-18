class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jbuilder"
  end

  def show
    # get ONE product from the db
    @product = Product.find_by(id: params[:id])
    render "show.json.jbuilder"
  end
end
