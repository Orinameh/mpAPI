class Product < ApplicationRecord
  validates :title, :user_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0}, presence: true
  belongs_to :user

  # Adds a class method for retrieving and querying objects.
  # scoping allows you to specify commonly used queries that can be referenced as method calls on models.
  scope :filter_by_title, lambda {|keyword| where('lower(title) LIKE ?', "%#{keyword.downcase}%") }
end
