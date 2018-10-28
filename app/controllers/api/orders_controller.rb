class Api::OrdersController < ApplicationController
  def create
    # most basic create action of all time
    p 'current_user'
    p current_user
    p 'current_user'
    @order = Order.new(
      product_id: params[:product_id],
      # current_user
      user_id: 1,
      quantity: params[:quantity]
    )
    # @order.save
    # how can i figure out why this isn't saving
    p @order.errors.full_messages
    render "show.json.jbuilder"

    # intake params
    # Order.new something something
    # order.save something something
    # render the new thing I jut saved
  end
end
