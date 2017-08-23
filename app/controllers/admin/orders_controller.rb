class Admin::OrdersController < ApplicationController
  before_action :valid_admin, :authenticate_user!
  before_action :set_order, only: [:finished]

  def index
    @orders = Order.in_command.or(Order.in_processing)
  end

  def cash_flow
    @orders = Order.in_finished
  end

  # def finished
  #   respond_to do |format|
  #     if @order.update(state: Order.states[:finished])
  #       format.html { redirect_to chef_orders_path, notice: 'Order was successfully updated.' }
  #     else
  #       format.html { redirect_to chef_orders_path }
  #     end
  #   end
  # end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end
end
