# == Schema Information
#
# Table name: dishes
#
#  id                   :integer          not null, primary key
#  name                 :string
#  description          :text
#  price                :float
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  chef_id              :integer
#  active               :boolean          default(FALSE)
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

require 'test_helper'

class DishTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

=begin
  setup do
    @dish = Dish.create!(name: 'plato1', description: 'prueba plato', price: 10.5, chef_id: 1)
  end

  test 'aumenta en 1 cuando se crea un dish nuevo' do
    assert_equal 1, Dish.count

    Dish.create!(name: 'plato2', description: 'prueba plato', price: 10.5, chef_id: 1)

    assert_equal 2, Dish.count
  end
=end
end
