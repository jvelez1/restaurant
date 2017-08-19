# == Schema Information
#
# Table name: cashiers
#
#  id         :integer          not null, primary key
#  name       :string
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cashier < ApplicationRecord
  has_one :user, as: :profile, dependent: :destroy
end
