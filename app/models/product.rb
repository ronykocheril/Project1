class Product < ApplicationRecord
  validates :name, :description, :price, :stock_quantity, presence: true
end
