class AddPicturetoDish < ActiveRecord::Migration[5.1]
  def change
    add_attachment :dishes, :picture
  end
end
