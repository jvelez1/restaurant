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
#  customer_id    :integer
#

class Order < ApplicationRecord
  has_many :quantities, inverse_of: :order
  has_many :dishes, through: :quantities
  belongs_to :customer

  enum state: [ :commands, :processing, :finished ]
  enum payment_method: [ :cash, :card ]

  accepts_nested_attributes_for :quantities,
                                :reject_if => :all_blank,
                                :allow_destroy => true
  # accepts_nested_attributes_for :dishes

  scope :in_commands, -> { where(state: states[:commands]) }

  def update_total
    vartotal = 0
    dishes.each do |dish|
      vartotal = vartotal + dish.price
    end
    self.total =  vartotal
    save!
  end
end