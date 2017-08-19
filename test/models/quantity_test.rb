# == Schema Information
#
# Table name: quantities
#
#  id       :integer          not null, primary key
#  order_id :integer
#  dish_id  :integer
#  quantity :integer
#
# Indexes
#
#  index_quantities_on_dish_id   (dish_id)
#  index_quantities_on_order_id  (order_id)
#

require 'test_helper'

class QuantityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
