class CreateLineitems < ActiveRecord::Migration[5.1]
  def change
    create_table :lineitems do |t|
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
