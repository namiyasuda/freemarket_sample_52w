class Size < ApplicationRecord
  has_many :products
  has_ancestry
  has_many :category_sizes
  has_many :categories, through: :category_sizes
end