class CreateQuantities < ActiveRecord::Migration[5.1]
  def change
    create_table :quantities do |t|
      t.references :order
      t.references :dish
    end
  end
end
