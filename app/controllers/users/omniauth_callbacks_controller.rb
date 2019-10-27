# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    # user.rbで定義したクラスメソッド find_oauth を実行
    user = User.find_oauth(request.env["omniauth.auth"])
    # すでにユーザーデータが存在している場合ログインする
    if user.present?
      sign_in_and_redirect user, event: :authentication
    # ユーザーデータがない場合は新規登録ビューへインスタンスを渡す
    else
      @auth = request.env["omniauth.auth"]
      @user = User.new 
    end
  end

  def failure
    redirect_to root_path and return
  end
  
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
