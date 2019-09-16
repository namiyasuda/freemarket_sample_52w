class MypagesController < ApplicationController
  before_action :move_to_login

  def show
    @user = User.find(current_user.id)
    @products = Product.where('seller_id LIKE(?)', current_user.id)
  end

  def profile
    @user = User.find(current_user.id)
  end

  def logout
  end

  def personal_info
    @user = User.find(current_user.id)
    @user_address = UserAddress.find_by(user_id: current_user.id)
  end

  def create_user_address
    UserAddress.create(user_address_params)
  end

  private
  def user_address_params
    params.permit(:postcode, :prefecture_id, :city, :block, :building).merge(user_id: current_user.id)
  end
end
