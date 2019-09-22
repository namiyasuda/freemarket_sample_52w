class AuthSignupController < ApplicationController
  def auth_sms_comfi
    session[:nickname] = sns_user_params[:nickname]
    session[:email] = sns_user_params[:email]
    session[:password] = sns_user_params[:password]
    session[:password_confirmation] = sns_user_params[:password]
    session[:last_name] = sns_user_params[:last_name]
    session[:first_name] = sns_user_params[:first_name]
    session[:last_name_kana] = sns_user_params[:last_name_kana]
    session[:first_name_kana] = sns_user_params[:first_name_kana]
    session[:birth_year_id] = sns_user_params[:birth_year_id]
    session[:birth_month] = sns_user_params[:birth_month]
    session[:birth_day] = sns_user_params[:birth_day]
    session[:uid] = sns_user_params[:uid]
    session[:provider] = sns_user_params[:provider]
    @user = User.new
  end

  def create
  # 例外処理とトランザクションを使用し片方のみレコードが登録される事を防止
    begin
      ActiveRecord::Base.transaction do
        @user = User.create!(
          nickname: session[:nickname],
          email: session[:email],
          password: session[:password],
          password_confirmation: session[:password],
          last_name: session[:last_name], 
          first_name: session[:first_name], 
          last_name_kana: session[:last_name_kana], 
          first_name_kana: session[:first_name_kana],
          birth_year_id: session[:birth_year_id], 
          birth_month: session[:birth_month], 
          birth_day: session[:birth_day], 
          mobile_number: sns_user_params[:mobile_number]
        )
        SnsCredential.create!(
          uid: session[:uid],
          provider: session[:provider],
          user_id: @user.id
        )
      end
      sign_in(@user)
      redirect_to new_address_path
    rescue
      redirect_to new_signup_path
    end
  end

  private
  def sns_user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation, 
      :last_name, 
      :first_name, 
      :last_name_kana, 
      :first_name_kana, 
      :birth_year_id,
      :birth_month,
      :birth_day,
      :mobile_number,
      :uid,
      :provider
  )
  end
end
