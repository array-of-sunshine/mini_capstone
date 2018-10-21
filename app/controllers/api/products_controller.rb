class Api::ProductsController < ApplicationController
  def index
    search_term = params[:user_input]
    @products = Product.where('name LIKE ?', "%#{search_term}%")
    if params[:sort] == 'price'
      # sort by price
      @products = @products.order(:price => :asc)
    else
      # sort by id
      @products = @products.order(:id => :asc)
    end
    render "index.json.jbuilder"
  end

  def show
    # get some data from the db, and show it to the user
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.json.jbuilder"
  end


  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]
    )
    # the save could work, the save could break
    if @product.save
      p "product saved"
      # do something -- do the regular thing
      render "show.json.jbuilder"
    else
      p 'product did not save'
      # do some other thing, tell the user they made a mistake
      render "errors.json.jbuilder"
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]
    )
    render "show.json.jbuilder"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "You just deleted the item"}
  end
end
