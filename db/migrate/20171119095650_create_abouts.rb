class CreateAbouts < ActiveRecord::Migration[5.1]
  def change
    create_table :abouts do |t|
      t.string :name
      t.text :description
      t.string :other

      t.timestamps
    end
  end
end
