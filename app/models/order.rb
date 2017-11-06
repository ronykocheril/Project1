class Order < ApplicationRecord
  validates :status, :pst, :gst, :hst, presence: true
end
