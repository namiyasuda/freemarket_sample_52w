class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :seller_products, class_name: 'Product', :foreign_key => 'seller_id'
  has_many :buyer_products, class_name: 'Product', :foreign_key => 'buyer_id'
  has_many :sns_credentials, dependent: :destroy
  # has_many :points 
  has_one :delivery_address, dependent: :destroy
  has_one :card, dependent: :destroy
  has_one :user_addresse, dependent: :destroy
  belongs_to_active_hash :birth_year

  validates :mobile_number, uniqueness: true

  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end
end
