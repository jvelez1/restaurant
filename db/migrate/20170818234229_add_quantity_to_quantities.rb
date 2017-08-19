class AddQuantityToQuantities < ActiveRecord::Migration[5.1]
  def change
    add_column :quantities, :quantity, :integer
  end
end
