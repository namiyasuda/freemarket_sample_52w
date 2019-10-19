class TopsController < ApplicationController
  before_action :get_publishing_products,:set_category, only: [:index ,:search]

  def index
    ranking1 = @publishing_products.group(:parent_id).order('count_parent_id DESC').limit(4).count(:parent_id).keys
    
    @category1 = Category.find_by(id: ranking1[0])
    @products1 = @publishing_products.where(parent_id: ranking1[0]).order('id DESC').limit(4)
    
    @category2 = Category.find_by(id: ranking1[1])
    @products2 = @publishing_products.where(parent_id: ranking1[1]).order('id DESC').limit(4)
    
    @category3 = Category.find_by(id: ranking1[2])
    @products3 = @publishing_products.where(parent_id: ranking1[2]).order('id DESC').limit(4)

    @category4 = Category.find_by(id: ranking1[3])
    @products4 = @publishing_products.where(parent_id: ranking1[3]).order('id DESC').limit(4)

    ranking2 = @publishing_products.group(:brand_id).order('count_brand_id DESC').limit(4).count(:brand_id).keys
    
    @brand1 = Brand.find_by(id: ranking2[0])
    @products5 = @publishing_products.where(brand_id: ranking2[0]).order('id DESC').limit(4)
    
    @brand2 = Brand.find_by(id: ranking2[1])
    @products6 = @publishing_products.where(brand_id: ranking2[1]).order('id DESC').limit(4)
    
    @brand3 = Brand.find_by(id: ranking2[2])
    @products7 = @publishing_products.where(brand_id: ranking2[2]).order('id DESC').limit(4)
    
    @brand4 = Brand.find_by(id: ranking2[3])

    @products8 = @publishing_products.where(brand_id: ranking2[3]).order('id DESC').limit(4)
  end

  def search
    ranking1 = @publishing_products.group(:parent_id).order('count_parent_id DESC').limit(4).count(:parent_id).keys
    
    @category1 = Category.find_by(id: ranking1[0])
    @products1 = @publishing_products.where(parent_id: ranking1[0]).order('id DESC').limit(4)
    
    @category2 = Category.find_by(id: ranking1[1])
    @products2 = @publishing_products.where(parent_id: ranking1[1]).order('id DESC').limit(4)
    
    @category3 = Category.find_by(id: ranking1[2])
    @products3 = @publishing_products.where(parent_id: ranking1[2]).order('id DESC').limit(4)

    @category4 = Category.find_by(id: ranking1[3])
    @products4 = @publishing_products.where(parent_id: ranking1[3]).order('id DESC').limit(4)

    ranking2 = @publishing_products.group(:brand_id).order('count_brand_id DESC').limit(4).count(:brand_id).keys
    
    @brand1 = Brand.find_by(id: ranking2[0])
    @products5 = @publishing_products.where(brand_id: ranking2[0]).order('id DESC').limit(4)
    
    @brand2 = Brand.find_by(id: ranking2[1])
    @products6 = @publishing_products.where(brand_id: ranking2[1]).order('id DESC').limit(4)
    
    @brand3 = Brand.find_by(id: ranking2[2])
    @products7 = @publishing_products.where(brand_id: ranking2[2]).order('id DESC').limit(4)
    
    @brand4 = Brand.find_by(id: ranking2[3])

    @products8 = Product.where(brand_id: ranking2[3]).order('id DESC').limit(4)
  end

  def get_publishing_products
    @publishing_products = Product.where(buyer_id: nil, listing_stop: false)
  end
end

