class Category < ApplicationRecord
  has_many :products
  has_ancestry
  has_many :sizes, through: :category_sizes
end
