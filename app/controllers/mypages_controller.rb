class MypagesController < ApplicationController
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
end
