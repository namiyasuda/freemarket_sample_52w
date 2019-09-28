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

  # 配送料の負担を選択された後に動くajax
  def get_delivery_method
    @delivery_methods = DeliveryMethod.where(payside_id: params[:paySide_id].to_i)
  end

  def create
    product = Product.new(product_params)
    if product.save
      if (brand_name = params[:product][:brand][:name]).present?
        unless brand=Brand.find_by(name: brand_name)
          brand = Brand.create(name: brand_name)
        end
        product.update(brand_id: brand.id)
      end
        params[:images][:image].each do |image|
        product.images.create(name: image, product_id: product.id)
      end
      redirect_to new_product_path, notice: '出品が成功しました'
    else
      redirect_to new_product_path, alert: '出品が失敗しました'
    end
  end

  def destroy
    # 暫定的にログインユーザーの出品した商品で一番古い物を消す様にしてあります
    my_product = Product.where(seller_id: current_user.id).first
    begin
      my_product.destroy!
      flash[:success] = '商品を削除しました'
    rescue
      flash[:danger] = '商品を削除できませんでした'
    end
    redirect_to listing_product_user_mypage_path(current_user)
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
      :parent_id,
      :child_id,
      :delivery_method_id,
      images_attributes: [:image],
      brand_attributes: [:brand]
      ).merge(seller_id: current_user.id)
  end
end
