class TopsController < ApplicationController
  def index
    # @products = Product.order('id ASC').limit(4)
    @images = Image.order('id ASC').limit(4)
   
  end
end
