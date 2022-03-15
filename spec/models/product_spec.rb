require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with valid information" do
      category = Category.new
      product = Product.new(name: "toy", price: 3, quantity: 2, category: category)
      expect(product).to be_valid
    end

    it "is not valid without a name" do
      category = Category.new
      product = Product.new(name: nil, price: 3, quantity: 2, category: category)
      expect(product).to_not be_valid
    end
    it "is not valid without a price" do
      category = Category.new
      product = Product.new(name: "toy", price_cents: nil, quantity: 2, category: category)
      expect(product).to_not be_valid
    end
    it "is not valid without a quanitity" do
      category = Category.new
      product = Product.new(name: "toy", price: 3, quantity: nil, category: category)
      expect(product).to_not be_valid
    end
    it "is not valid without a category" do
      category = Category.new
      product = Product.new(name: "toy", price: 3, quantity: 2, category: nil)
      expect(product).to_not be_valid
    end

end

end
