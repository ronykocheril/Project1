class About < ApplicationRecord
  validates :name, :description, :other, presence: true
end
