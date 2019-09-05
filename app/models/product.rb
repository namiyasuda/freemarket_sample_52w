class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :size
  belongs_to_active_hash :state
  belongs_to_active_hash :paying_side
  belongs_to_active_hash :delivery_day
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
  belongs_to :category
  belongs_to :brand
  has_many :images, dependent: :destroy

  mount_uploader :image, ImageUploader
end
