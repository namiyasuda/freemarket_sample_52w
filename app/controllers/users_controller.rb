class UsersController < ApplicationController
  def update
    user = User.find(current_user.id)
    user.update(profile_params)
    if user.save
      redirect_to profile_user_mypage_path(user_id: params[:id])
    else
      render profile_user_mypage_path(user_id: params[:id])
    end
  end

  private
  def profile_params
    params.require(:user).permit(:nickname, :profile)
  end
end
