class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :seller_transactions, class_name: 'Product'
  has_many :buyer_transactions, class_name: 'Product'
  has_many :sns_credentials, dependent: :destroy
  # has_many :points 
  has_one :delivery_address, dependent: :destroy
  has_one :card, dependent: :destroy
  has_one :user_addresse, dependent: :destroy
  belongs_to_active_hash :birth_year

  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
end
