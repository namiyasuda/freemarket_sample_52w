class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:last_name,:first_name,:last_name_kana,:first_name_kana,:birth_year,:birth_month,:birth_day,:mobile_number,:profile,:sales_money])
  end

  def after_sign_in_path_for(resource)
    tops_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
  

  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
