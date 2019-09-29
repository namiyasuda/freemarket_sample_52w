class BuysController < ApplicationController
  before_action :get_product

  def show
    @image = @product.images.first
    @delivery_addresses = current_user.delivery_address
    @card = current_user.card
    if @card.present?
      customer = Card.get_payjp_customer_info(@card)
      # application_controllerで定義したメソッドを呼び出し
      set_card_info(customer, @card)
    end
  end

  def pay
    Product.transaction do
      @product.update(buyer_id: current_user.id)
      amount = @product.price
      customer = Card.get_payjp_customer_info(current_user.card)
      create_charge_by_customer(customer, amount)
    end
      flash[:success] = '購入に成功しました'
      redirect_to user_mypage_path(current_user)
    rescue
      flash[:product_danger] = '購入に失敗しました'
      redirect_to product_buys_path
  end

end

def get_product
  @product = Product.find(params[:product_id])
end

# カスタマー情報で支払いを行う。
def create_charge_by_customer(customer, amount)
  Payjp::Charge.create(
    amount:   amount,
    customer: customer,
    currency: 'jpy'
  )
end
