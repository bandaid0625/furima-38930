require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品の購入' do
    context '商品の購入ができるとき' do
      it '購入するitemと、userが紐付いている時' do
        expect(@order).to be_valid
      end
    end
    context '商品の購入ができないとき' do
      it 'itemが紐付いていない時' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item must exist")
      end
      it 'userが紐付いていない時' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User must exist")
      end
    end
  end
end
