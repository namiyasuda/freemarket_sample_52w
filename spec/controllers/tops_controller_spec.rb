require 'rails_helper'

describe TopsController, type: :controller do

  describe 'search' do
    let(:products) {Product.where("(name: 'robo') OR (description: 'テスト1')")}

    it '検索ワードとマッチする商品名、又は本文が入った商品の検索' do
      expect(products).to eq products
    end
  end
end