# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  state          :integer          default("commands")
#  payment_method :integer          default("cash")
#  total          :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Order < ApplicationRecord
  has_many :quantities, inverse_of: :order
  has_many :dishes, through: :quantities

  enum state: [ :commands, :processing, :finished ]
  enum payment_method: [ :cash, :card ]

  accepts_nested_attributes_for :quantities,
                                :reject_if => :all_blank,
                                :allow_destroy => true
  # accepts_nested_attributes_for :dishes
end
