class AddProductRefToLineitems < ActiveRecord::Migration[5.1]
  def change
    add_reference :lineitems, :product, foreign_key: true
  end
end
