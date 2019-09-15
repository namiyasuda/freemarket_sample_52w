require 'rails_helper'
describe Product do
  describe '#create' do
    it "is invalid without a name" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a description" do
      product = build(:product, description: "")
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end

    it "is valid without a brand_id" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "is invalid without a state_id" do
      product = build(:product, state_id: "")
      product.valid?
      expect(product.errors[:state_id]).to include("can't be blank")
    end

    it "is invalid without a paying_side_id" do
      product = build(:product, paying_side_id: "")
      product.valid?
      expect(product.errors[:paying_side_id]).to include("can't be blank")
    end

    it "is invalid without a prefecture_id" do
      product = build(:product, prefecture_id: "")
      product.valid?
      expect(product.errors[:prefecture_id]).to include("can't be blank")
    end

    it "is invalid without a delivery_day_id" do
      product = build(:product, delivery_day_id: "")
      product.valid?
      expect(product.errors[:delivery_day_id]).to include("can't be blank")
    end

    it "is invalid without a price" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "is invalid without a parent_id" do
      product = build(:product, parent_id: "")
      product.valid?
      expect(product.errors[:parent_id]).to include("can't be blank")
    end

    it "is invalid without a child_id" do
      product = build(:product, child_id: "")
      product.valid?
      expect(product.errors[:child_id]).to include("can't be blank")
    end

    it "is invalid without a delivery_method_id" do
      product = build(:product, delivery_method_id: "")
      product.valid?
      expect(product.errors[:delivery_method_id]).to include("can't be blank")
    end
    
    it "is invalid with a kname that has more than 40 characters " do
      product = build(:product, name: "12345678901234567890123456789012345678901")
      product.valid?
      expect(product.errors[:name][0]).to include("is too long")
    end

    it "is valid with a name that has less than 40 characters " do
      product = build(:product, name: "1234567890123456789012345678901234567890")
      expect(product).to be_valid
    end

  end
end