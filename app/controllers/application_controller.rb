class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def after_sign_in_path_for resource
    binding.pry
    if current_user.chef?
      chef_orders_path
    elsif current_user.cashier?
      cashier_orders_path
    elsif current_user.admin?
      admin_orders_path
    end
  end
end
