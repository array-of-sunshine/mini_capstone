class Api::ProductsController < ApplicationController
  def show
    # get some data from the db, and show it to the user
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.json.jbuilder"
  end

  def index
    @products = Product.all
    render "index.json.jbuilder"
  end

  def create
    @product = Product.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    @product.save
    render "show.json.jbuilder"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    render "show.json.jbuilder"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "You just deleted the item"}
  end
end
