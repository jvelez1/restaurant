class Chef::OrdersController < ApplicationController
  before_action :set_order, only: [:finished]
  def index
    @orders = Order.in_command.or(Order.in_processing)
  end

  def process
    respond_to do |format|
      if @order.command? && @order.processing!
        format.html { redirect_to chef_orders_path, notice: 'Order was successfully updated.' }
      else
        format.html { redirect_to chef_orders_path }
      end
    end
  end

  def finalized
    respond_to do |format|
      if @order.processing? && @order.finished!
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
