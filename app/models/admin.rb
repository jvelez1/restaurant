# == Schema Information
#
# Table name: admins
#
#  id         :integer          not null, primary key
#  name       :string
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Admin < ApplicationRecord
  has_one :user, as: :profile, dependent: :destroy
end
