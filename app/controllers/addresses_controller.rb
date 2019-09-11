class AddressesController < ApplicationController
  before_action :authenticate_user!
  def new
    @delivery_address = DeliveryAddress.new
  end

  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.user = current_user
    if @delivery_address.save!
      redirect_to card_signup_index_path
    else
      render new_address_path
    end
  end

private

def delivery_address_params
  params.require(:delivery_address).permit(
    :user_id,
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
  )
end
end