class Placement < ApplicationRecord
  belongs_to :order
  belongs_to :product, inverse_of: :placements

  after_create :decrement_product_quantity!

  def decrement_product_quantity!
    # decrement! helps to skip callbacks
    product.decrement!(:quantity, quantity)
  end
end
