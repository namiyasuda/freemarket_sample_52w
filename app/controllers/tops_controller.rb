class TopsController < ApplicationController
  def index
    @images1 = Image.limit(4).order('id DESC')
    @images2 = Image.limit(8).order('id DESC')-@images1
    @images3 = Image.limit(12).order('id DESC')-@images1-@images2
    @images4 = Image.limit(16).order('id DESC')-@images1-@images2-@images3
    @images5 = Image.limit(20).order('id DESC')-@images1-@images2-@images3-@images4
  end
end
