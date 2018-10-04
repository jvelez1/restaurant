class Cashier::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @order.quantities.build(quantity: 0).build_dish
  end

  def create
    @order = Order.create(order_params)
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end



  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.fetch(:order, {}).permit(:state, :payment_method, :total, :quantities_attributes=>[:quantity, :dish_attributes=> [:id]])
  end


end
