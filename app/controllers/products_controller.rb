class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    # binding.pry
  end

  def new
    @category_parents = Category.where(ancestry: nil)
    @product = Product.new
    @image = Image.new
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
      params[:images][:image].each do |image|
        # binding.pry
        @product.images.create(name: image, product_id: @product.id)
      end
      redirect_to new_product_path, notice: '出品が成功しました'
    else
      @category_parents = Category.where(ancestry: nil)
      flash.now[:alert] = '出品が失敗しました'
      format.html{render action: 'new'}
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
      images_attributes: [:image]
      ).merge(seller_id: 1)
  end
end
