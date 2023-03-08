require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '写真、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元、発送までの日数、価格、全てが揃っている時' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '写真が空のとき' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空のとき' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空のとき' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが選択されていないとき' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が選択されていないとき' do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が選択されていないとき' do
        @item.charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it '発送元が選択されていないとき' do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が選択されていないとき' do
        @item.sheduled_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sheduled day can't be blank")
      end
      it '価格の情報がない時' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300以下のとき' do
        @item.price = Faker::Number.between(from: 0, to: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格が9999999以上のとき' do
        @item.price = Faker::Number.number(8)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格に全角数字が入っている時' do
        @item.price = "１２３４５"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it '価格に全角文字が入っている時' do
        @item.price = "一二三四"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it 'userが紐付いて以内場合' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end


end
