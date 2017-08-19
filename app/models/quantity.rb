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

class Quantity < ApplicationRecord
  belongs_to :order, inverse_of: :quantities
  belongs_to :dish, inverse_of: :quantities

  accepts_nested_attributes_for :dish


  validates_presence_of :order
  validates_presence_of :dish
end
