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

class Dish < ApplicationRecord
  has_many :quantities, inverse_of: :dish
  has_many :orders, through: :quantities
  belongs_to :chef

  has_attached_file :picture, styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/imagenes/:style/miss.jpg'

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/


  def my_chef?(chef_)
    chef == chef_ ? true : false
  end

  def active_?
    if active
      'Active'
    else
      'disabled'
    end
  end

end
