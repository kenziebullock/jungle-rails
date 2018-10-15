require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it 'should create a successful @product' do
      @product = Product.new({
        name: 'hey',
        price: 1.00,
        quantity: 1,
        category: Category.new
      })
      expect(@product.save).to be true
    end

    it 'should not validate with empty fields' do
      @product = Product.new(name: nil)
      expect(@product.valid?).to be false
    end

    it 'should not validate @product with no price' do
      @product = Product.new(
        name: 'something', 
        price: nil
      )
      expect(@product.valid?).to be false
    end

    it 'should not validate @product with no quantity' do
      @product = Product.new(
        name: 'something',
        price: 1,
        quantity: nil
      )
      expect(@product.valid?).to be false
    end

    it 'should not validate @product with no category' do
      @product = Product.new(
        name: 'something',
        price: 1,
        quantity: 1,
        category: nil
      )
      expect(@product.valid?).to be false
    end

  end
end
