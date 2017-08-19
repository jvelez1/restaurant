# == Schema Information
#
# Table name: dishes
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  chef_id     :integer
#  active      :boolean          default(FALSE)
#

class Dish < ApplicationRecord
  has_many :quantities, inverse_of: :dish
  has_many :orders, through: :quantities
  belongs_to :chef

  def my_chef?(chef_)
    chef == chef_ ? true : false
  end
end
