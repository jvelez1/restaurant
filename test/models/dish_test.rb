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

require 'test_helper'

class DishTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
