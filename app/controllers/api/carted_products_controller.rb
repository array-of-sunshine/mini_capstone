class Api::CartedProductsController < ApplicationController
  def index
    # shouyld see 9, 10, 11
    # @carted_products = CartedProduct.where(user_id: current_user.id).where(status: 'carted')
    @carted_products = CartedProduct.where(user_id: current_user.id, status: 'carted')
    render 'index.json.jbuilder'
  end

  def create
    @carted_product = CartedProduct.new(
      status: 'carted',
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity]
    )
    @carted_product.save
    render 'show.json.jbuilder'
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.status = 'removed'
    @carted_product.save
    render json: { message: "You deleted the item from the db" }
  end
end
