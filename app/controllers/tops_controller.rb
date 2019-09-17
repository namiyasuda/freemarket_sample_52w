class TopsController < ApplicationController
  def index
    @images1 = Image.limit(4)
    @images2 = Image.where("id >= ? and id <= ?", 5, 8)
    @images3 = Image.where("id >= ? and id <= ?", 9, 12)
    @images4 = Image.where("id >= ? and id <= ?", 13, 16)
    @images5 = Image.where("id >= ? and id <= ?", 17, 20)
  end
end
