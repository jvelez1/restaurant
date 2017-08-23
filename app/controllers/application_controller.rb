class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def after_sign_in_path_for resource
    if current_user.chef?
      chef_orders_path
    elsif current_user.cashier?
      cashier_orders_path
    elsif current_user.admin?
      admin_orders_path
    end
  end

  def valid_admin
    unless current_user.admin?
      destroy_session_user
    end
  end

  def valid_chef
    unless current_user.chef?
      destroy_session_user
    end
  end

  def valid_cashier
    unless current_user.cashier?
      destroy_session_user
    end
  end

  private
  def destroy_session_user
    sign_out(current_user)
    redirect_to unauthenticated_root_path,
                alert: 'You do not have permission to access '
  end

end

