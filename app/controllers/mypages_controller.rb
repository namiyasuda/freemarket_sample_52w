class MypagesController < ApplicationController
  before_action :move_to_login, :set_card_path, :set_todo_count,:set_category

  def show
    @listing_product = current_user.seller_products
    @bought_products = current_user.buyer_products.where(evaluation: nil).order('id DESC')
    @past_trade_products = current_user.buyer_products.where.not(evaluation: nil).order('id DESC')
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
    card = current_user.card
    if card.blank?
      redirect_to action: "payment" 
    else
      customer = Card.get_payjp_customer_info(card)
      # application_controllerで定義したメソッドを呼び出し
      set_card_info(customer, card)
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
    @delivery_address = current_user.delivery_address.nil? ? DeliveryAddress.new : current_user.delivery_address
  end

  def listing_product
    @products = current_user.seller_products.where(buyer_id: nil, evaluation: nil).order('id DESC')
  end

  def during_trade
    @products = current_user.seller_products.where(evaluation: nil).where.not(buyer_id: nil).order('id DESC')
  end

  def sold
    @products = current_user.seller_products.where.not(buyer_id: nil, evaluation: nil).order('id DESC')
  end

  def bought_product
    @products = current_user.buyer_products.where(evaluation: nil).order('id DESC')
  end

  def past_trade
    @products = current_user.buyer_products.where.not(evaluation: nil).order('id DESC')
  end

  def todo
    @products = current_user.buyer_products.where(evaluation: nil).order('id DESC')
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

  def set_todo_count
    @todo_count = current_user.buyer_products.where(evaluation: nil).count
  end
end
