class MypagesController < ApplicationController
  before_action :move_to_login

  def show
    @products = Product.where(seller_id: current_user.id)
  end

  def profile
  end

  def payment
  end

  def card_reg
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
  def destroy #PayjpとCardのデータベースを削除
    @card = current_user.card
    Payjp.api_key = "sk_test_d186521dfc37df79995c04e3"
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy #削除に成功した時にポップアップを表示します。
      redirect_to payment_user_mypage_path, notice: "削除しました"
    else #削除に失敗した時にアラートを表示します。
      redirect_to action: "index", alert: "削除できませんでした"
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
      redirect_to personal_info_user_mypage_path(user_id: params[:user_id])
    else
      flash.now[:danger] = '登録できませんでした。'
      render personal_info_user_mypage_path(user_id: params[:user_id])
    end
  end

  private
  def user_address_params
    params.permit(:postcode, :prefecture_id, :city, :block, :building).merge(user_id: current_user.id)
  end
end
