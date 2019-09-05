class ProductsController < ApplicationController

  def new
    @category_parents = Category.where(ancestry: nil)
    @product = Product.new
  end

   # 親カテゴリーが選択された後に動くアクションAjax
  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  # 子カテゴリーが選択された後に動くアクションAjax
  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to new_product_path
    else
      @category_parents = Category.where(ancestry: nil)
      render :new
    end
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
      :price)
  end
end
