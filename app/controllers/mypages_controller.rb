class MypagesController < ApplicationController
  before_action :move_to_login, :set_card_path

  def show
    @products = Product.where(seller_id: current_user.id)
  end

  def profile
  end

  def payment
  end

  def card_reg
    @card_path = card_reg_user_mypage_path
  end
  
  def create_card
    Payjp.api_key = 'sk_test_d186521dfc37df79995c04e3'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to card_show_user_mypage_path
      else
        redirect_to action: "create"
      end
    end
  end
  def card_show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "payment" 
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
  
  def logout
  end

  def personal_info
    @user_address = UserAddress.find_by(user_id: current_user.id)
  end

  def create_user_address
    if UserAddress.create(user_address_params)
      flash[:success] = '登録しました。'
      redirect_to personal_info_user_mypage_path(current_user)
    else
      flash.now[:danger] = '登録できませんでした。'
      render personal_info_user_mypage_path(current_user)
    end
  end

  def delivery_address
  end

  private
  def user_address_params
    params.permit(:postcode, :prefecture_id, :city, :block, :building).merge(user_id: current_user.id)
  end

  def set_card_path
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      @card_path = payment_user_mypage_path
    else
      @card_path = card_show_user_mypage_path
    end
  end
end
