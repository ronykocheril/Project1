class Lineitem < ApplicationRecord
  validates :price, :quantity, presence: true
end
