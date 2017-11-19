class About < ApplicationRecord
  validates :name, :description, presence: true
end
