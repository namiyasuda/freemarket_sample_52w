class DeliveryAddressesController < ApplicationController
  before_action :authenticate_user!
  def new
    @delivery_address = DeliveryAddress.new
  end

  def create
    delivery_address = DeliveryAddress.new(delivery_address_params)
    # マイページで登録した場合はマイページへリダイレクトさせる
    if Rails.application.routes.recognize_path(request.referer)[:controller] == "mypages"
      if delivery_address.save!
        flash[:success] = '登録しました。'
      else
        flash.now[:danger] = '登録できませんでした。'
      end
      redirect_to delivery_address_user_mypage_path(current_user)
    # 新規登録フォームで登録した場合はカード登録へリダイレクトさせる
    else
      if delivery_address.save!
        redirect_to new_card_path
      else
        render new_address_path
      end
    end
  end

  def update
    if current_user.delivery_address.update(delivery_address_params)
      flash[:success] = '変更しました。'
    else
      flash.now[:danger] = '変更できませんでした。'
    end
    redirect_to delivery_address_user_mypage_path(current_user)
  end

private

  def delivery_address_params
    params.require(:delivery_address).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :postcode,
      :prefecture_id,
      :city,
      :block,
      :building,
      :phone_number
    ).merge(user_id: current_user.id)
  end
end