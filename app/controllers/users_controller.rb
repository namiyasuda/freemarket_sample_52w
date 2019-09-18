class UsersController < ApplicationController
  def update
    current_user.update(profile_params)
    if current_user.save
      flash[:success] = '変更しました。'
      redirect_to profile_user_mypage_path(user_id: params[:id])
    else
      flash.now[:danger] = '変更できませんでした。'
      render profile_user_mypage_path(user_id: params[:id])
    end
  end

  private
  def profile_params
    params.require(:user).permit(:nickname, :profile)
  end
end
