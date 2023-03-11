require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    item = FactoryBot.create(:user)
    user = FactoryBot.create(:user)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
  end

  describe '商品の購入' do
    context '商品の購入ができる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_shipping.building = ""
        expect(@order_shipping).to be_valid
      end
    end
    context '商品の購入ができないとき' do
      it '郵便番号がない時' do
        @order_shipping.postal_code = ""
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が半角以外で入力されているとき' do
        @order_shipping.postal_code = "１２３−４５６７"
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないとき' do
        @order_shipping.postal_code = "1234567"
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県が選択されていない時' do
        @order_shipping.prefecture_id = "1"
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村が入力されていない時' do
        @order_shipping.city = ""
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end
      it '番地が入力されていない時' do
        @order_shipping.street_num = ""
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Street num can't be blank")
      end
      it '電話番号が入力されていない時' do
        @order_shipping.tel = ""
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Tel can't be blank")
      end
      it 'userが紐付いていない時' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていない時' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end



