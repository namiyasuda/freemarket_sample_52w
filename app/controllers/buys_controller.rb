class BuysController < ApplicationController
  def show
    @product = Product.find_by(id: 1)
    @image = Image.find_by(id: 1)
    @delivery_addresses = DeliveryAddress.find_by(user_id: current_user.id)
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to payment_user_mypage_path
    else
      Payjp.api_key = 'sk_test_d186521dfc37df79995c04e3'
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      @card_brand = @default_card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/visa.svg?575670517"
      when "JCB"
        @card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/jcb.svg?575670517"
      when "MasterCard"
        @card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/master-card.svg?575670517"
      when "American Express"
        @card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/american_express.svg?575670517"
      when "Diners Club"
        @card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/dinersclub.svg?575670517"
      when "Discover"
        @card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/discover.svg?575670517"
      when "SaisonCard"
        @card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/saison-card.svg?575670517"
      end
    end
  end
end
