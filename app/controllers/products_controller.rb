class ProductsController < ApplicationController

  def new
    @category_parents = Category.where(ancestry: nil)
  end

   # 親カテゴリーが選択された後に動くアクションAjax
  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  # 子カテゴリーが選択された後に動くアクションAjax
  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

end
