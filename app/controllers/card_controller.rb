class CardController < ApplicationController
  require "payjp"

  def new
    @card = Card.find_by(user_id: current_user.id)
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

  def show
  end
end

