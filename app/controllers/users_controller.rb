class UsersController < ApplicationController
  def update
    if current_user.update(profile_params)
      flash[:success] = '変更しました。'
      redirect_to profile_user_mypage_path(current_user)
    else
      flash.now[:danger] = '変更できませんでした。'
      render profile_user_mypage_path(current_user)
    end
  end

  private
  def profile_params
    params.require(:user).permit(:nickname, :profile)
  end
end
