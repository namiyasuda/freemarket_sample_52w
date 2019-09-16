class UserAddressesController < ApplicationController
  def update
    user_address = UserAddress.find_by(user_id: current_user.id)
    user_address.update(user_address_params)

    if user_address.save
      flash[:success] = '変更しました。'
      redirect_to personal_info_user_mypage_path(user_id: params[:id])
    else
      flash.now[:danger] = '変更できませんでした。'
      render personal_info_user_mypage_path(user_id: params[:id])
    end
  end

  private
  def user_address_params
    params.require(:user_address).permit(:postcode, :prefecture_id, :city, :block, :building)
  end
end
