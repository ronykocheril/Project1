class Order < ApplicationRecord
  belongs_to :user
  has_many :lineitems
  validates :status, :pst, :gst, :hst, :name, presence: true
end
