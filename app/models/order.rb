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

  scope :in_command, -> { where(state: [:commands]) }
  scope :in_processing, -> { where(state: [:processing]) }
  scope :in_finished, -> { where(state: [:finished]) }
  scope :today, -> { where("created_at BETWEEN '#{DateTime.now.beginning_of_day}' AND '#{DateTime.now.end_of_day}'") }
  scope :month, -> { where('created_at >= ? AND created_at <= ?', DateTime.now.beginning_of_month, DateTime.now.end_of_month) }

  def update_total
    vartotal = 0
    dishes.each do |dish|
      vartotal = vartotal + dish.price
    end
    self.total =  vartotal
    save!
  end

  def self.cash_flow_today
    today.in_finished.sum(:total)
  end

  def self.cash_flow_month
    month.in_finished.sum(:total)
  end
end
