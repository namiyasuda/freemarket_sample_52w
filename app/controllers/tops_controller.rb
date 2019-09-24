class TopsController < ApplicationController
  before_action :index
  def index
    ranking1 = Product.group(:parent_id).order('count_parent_id DESC').limit(4).count(:parent_id).keys
    
    @category1 = Category.find(ranking1[0])
    @products1 = Product.where(parent_id: ranking1[0]).order('id DESC').limit(4)
    
    @category2 = Category.find(ranking1[1])
    @products2 = Product.where(parent_id: ranking1[1]).order('id DESC').limit(4)
    
    @category3 = Category.find(ranking1[2])
    @products3 = Product.where(parent_id: ranking1[2]).order('id DESC').limit(4)

    @category4 = Category.find(ranking1[3])
    @products4 = Product.where(parent_id: ranking1[3]).order('id DESC').limit(4)
    

    ranking2 = Product.group(:brand_id).order('count_brand_id DESC').limit(4).count(:brand_id).keys
    
    @brand1 = Brand.find(ranking2[0])
    @products5 = Product.where(brand_id: ranking2[0]).order('id DESC').limit(4)
    
    @brand2 = Brand.find(ranking2[1])
    @products6 = Product.where(brand_id: ranking2[1]).order('id DESC').limit(4)
    
    @brand3 = Brand.find(ranking2[2])
    @products7 = Product.where(brand_id: ranking2[2]).order('id DESC').limit(4)
    
    @brand4 = Brand.find(ranking2[3])
    @products8 = Product.where(brand_id: ranking2[3]).order('id DESC').limit(4)

  end
end
