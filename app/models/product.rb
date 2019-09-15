class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :state
  belongs_to_active_hash :paying_side
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :delivery_method
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User', optional: true
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :size, optional: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images #一つのフォームで関連したテーブルにも保存させるため
  accepts_nested_attributes_for :brand

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { only_integer: true , greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :state_id, presence: true
  validates :paying_side_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :parent_id, presence: true, numericality: { only_integer: true}
  validates :child_id, presence: true, numericality: { only_integer: true}
  validates :delivery_method_id, presence: true, numericality: { only_integer: true}
  validates :listing_stop, inclusion: { in: [true, false] }

end
