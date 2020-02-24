class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :price, :published

  # adds a relationship key containing the user’s identifier:
  belongs_to :user
  cache_options enabled: true, cache_length: 12.hours
end

