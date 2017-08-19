class AddChefToDish < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :chef_id, :integer
  end
end
