class Category < ApplicationRecord
  validates :name, :descrition, presence: true
end
