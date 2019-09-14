class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def new
    @category_parents = Category.where(ancestry: nil)
    @product = Product.new
    @image = Image.new
    @brand = Brand.new
  end

   # 親カテゴリーが選択された後に動くアクションAjax
  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  # 子カテゴリーが選択された後に動くアクションAjax
  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  # 孫カテゴリーが選択された後に動くアクションAjax
  def get_size
    selected_category = Category.find(params[:category_id])
    if size_parent = selected_category.sizes[0]
      @sizes = size_parent.children
    elsif size_parent = selected_category.parent.sizes[0]
      @sizes = size_parent.children
    end
  end

  def create
    product = Product.new(product_params)
    if product.save
      if params[:product][:brand][:name]
        unless brand=Brand.find_by(name: params[:product][:brand][:name])
          brand = Brand.create(name: params[:product][:brand][:name])
          product.update(brand_id: brand.id)
        else
          product.update(brand_id: brand.id)
        end
        
      end
        params[:images][:image].each do |image|
        product.images.create(name: image, product_id: product.id)
      end
      redirect_to new_product_path, notice: '出品が成功しました'
    else
      redirect_to new_product_path, alert: '出品が失敗しました'
    end
  end

  def dropzone
    @product = Product.new
  end

  private

  def product_params
    params.require(:product).permit(
      :name, 
      :description, 
      :category_id, 
      :size_id, 
      :state_id, 
      :paying_side_id, 
      :prefecture_id, 
      :delivery_day_id, 
      :price,
      images_attributes: [:image],
      brand_attributes: [:brand]
      ).merge(seller_id: 1)
  end
end
