# == Schema Information
#
# Table name: chefs
#
#  id         :integer          not null, primary key
#  name       :string
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chef < ApplicationRecord
  has_one :user, as: :profile, dependent: :destroy
  has_many :dishes
end
