class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :price, :published

  # adds a relationship key containing the user’s identifier:
  belongs_to :user
end

