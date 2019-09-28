class BuysController < ApplicationController
  def show
    @product = Product.find_by(id: params[:product_id])
    @image = Image.find_by(id: params[:product_id])
    @delivery_addresses = DeliveryAddress.find_by(user_id: current_user.id)
    @card = Card.find_by(user_id: current_user.id)
    if @card.present?
      Payjp.api_key = 'sk_test_d186521dfc37df79995c04e3'
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @card_brand = @default_card_information.brand
      @card_src = Card.set_card_brand_icon(@card_brand)
    end
  end
end
