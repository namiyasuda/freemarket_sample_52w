class CardsController < ApplicationController
  require "payjp"

  def new
    @card = current_user.card
    redirect_to tops_path if @card.present?
  end

  def create
    Payjp.api_key = 'sk_test_d186521dfc37df79995c04e3'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to complete_signup_index_path
      else
        redirect_to action: "create"
      end
    end
  end

  def destroy #PayjpとCardのデータベースを削除
    @card = current_user.card
    Payjp.api_key = "sk_test_d186521dfc37df79995c04e3"
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy #削除に成功した時にポップアップを表示します。
      redirect_to payment_user_mypage_path(current_user)
      flash[:success] = '削除しました。'
    else #削除に失敗した時にアラートを表示します。
      redirect_to action: "index"
      flash.now[:danger] = '削除できませんでした。'
    end
end
  def show
    
  end
end

