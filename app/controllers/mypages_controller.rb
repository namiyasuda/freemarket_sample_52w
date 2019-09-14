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
  end

  private
  def move_to_login
    redirect_to controller: :signup, action: :index unless user_signed_in?
  end
end
