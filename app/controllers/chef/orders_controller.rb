class Chef::OrdersController < ApplicationController
  before_action :set_order, only: [:finished]
  def index
    @orders = Order.in_commands
  end

  def finished
    respond_to do |format|
      if @order.update(state: Order.states[:finished])
        format.html { redirect_to chef_orders_path, notice: 'Order was successfully updated.' }
      else
        format.html { redirect_to chef_orders_path }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end
end