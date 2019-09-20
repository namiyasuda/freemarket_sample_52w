class MypagesController < ApplicationController
  before_action :move_to_login

  def show
    @products = Product.where(seller_id: current_user.id)
  end

  def profile
  end

  def payment
    
  end

  def logout
  end

  def personal_info
    @user_address = UserAddress.find_by(user_id: current_user.id)
  end

  def create_user_address
    if UserAddress.create(user_address_params)
      flash[:success] = '登録しました。'
      redirect_to personal_info_user_mypage_path(user_id: params[:user_id])
    else
      flash.now[:danger] = '登録できませんでした。'
      render personal_info_user_mypage_path(user_id: params[:user_id])
    end
  end

  private
  def user_address_params
    params.permit(:postcode, :prefecture_id, :city, :block, :building).merge(user_id: current_user.id)
  end
end
