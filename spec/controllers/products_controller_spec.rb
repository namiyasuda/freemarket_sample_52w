require 'rails_helper'

describe ProductsController, type: :controller do

  describe 'GET #edit' do
    it "assigns the requested product to @product" do
      product = create(:product)
      get :edit, params: { id: product }
      expect(assigns(:product)).to eq product
    end

    it "renders the :edit template" do
      product = create(:product)
      get :edit, params: { id: product }
      expect(response).to render_template :edit
    end
  end 

end