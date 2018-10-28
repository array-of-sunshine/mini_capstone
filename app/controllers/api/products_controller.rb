class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]
  # before_action :authenticate_admin, except: [:index, :show]

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
      description: params[:description],
      supplier_id: 1
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
