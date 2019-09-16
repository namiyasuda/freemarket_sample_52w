class TopsController < ApplicationController
  def index
    @products = Product.order('id ASC').limit(4)
    @images = Image.find(1)
  end
end
