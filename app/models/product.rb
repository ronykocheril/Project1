class Product < ApplicationRecord
  belongs_to :category
  has_many :lineitems
  validates :name, :description, :price, :stock_quantity,presence: true
end
