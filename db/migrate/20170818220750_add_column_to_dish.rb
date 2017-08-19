class AddColumnToDish < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :active, :boolean, default: false
  end
end
