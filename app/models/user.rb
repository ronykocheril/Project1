class User < ApplicationRecord
  belongs_to :province
  has_many :categories
  has_many :orders
  validates :name, :password, presence: true
end
