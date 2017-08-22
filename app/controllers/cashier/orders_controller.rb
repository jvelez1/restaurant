class Cashier::OrdersController < ApplicationController
  def index
    @orders = Order.by_date
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    @order.update_total
    redirect_to cashier_orders_path
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end



  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.fetch(:order, {}).permit(:state, :payment_method, :total, :customer_id, dish_ids:[])
  end


end