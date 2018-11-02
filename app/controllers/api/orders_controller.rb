class Api::OrdersController < ApplicationController
  # before_action :authenticate_user

  def index
    # @orders = Order.where(user_id: current_user.id)
    @orders = current_user.orders
    render "index.json.jbuilder"
  end

  def create
    # one product
    # group of products
    # how can i get the correct products? why don't i want all of them?
    # @carted_products = CartedProduct.where(user_id: current_user.id, status: 'carted')
    # # go to each product the user want to buy and figure out how much it costs (also factor in quantity)
    # @order = Order.new(
    #   user_id: current_user.id,
    #   subtotal: ,
    #   tax: ,
    #   total:
    # )
    # @order.save
    # # how can i figure out why this isn't saving
    # p @order.errors.full_messages
    # render "show.json.jbuilder"

    # intake params
    # Order.new something something
    # order.save something something
    # render the new thing I jut saved
  end
end
