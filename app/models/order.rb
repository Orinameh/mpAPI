class Order < ApplicationRecord
  belongs_to :user
  validates :total, numericality: {greater_than_or_equal_to: 0}
  validates :total, presence: true

  # placement is the table that contains order_id and product_id (many to many relationships)
  has_many :placements, dependent: :destroy
  has_many :products, through: :placements
end
