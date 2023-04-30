require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入機能' do
    context '購入できる場合' do
      it "すべての項目が適切に入力されている" do
        expect(@order_address).to be_valid
      end
      it "建物以外が適切に入力されている" do
        expect(@order_address).to be_valid
      end
    end

    context '購入できない場合' do
      it "郵便番号が適切でない" do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid")
      end
      it "郵便番号が空" do
        @order_address.post_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it "都道府県が未選択" do
        @order_address.region_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Region must be other than 1")
      end
      it "市区町村が空" do
        @order_address.municipality = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地が空" do
        @order_address.number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Number can't be blank")
      end
      it "電話番号が空" do
        @order_address.telephone = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it "電話番号が適切でない" do
        @order_address.telephone = "090-1234-5678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is not a number")
      end
      it "ユーザーidが空" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "商品idが空" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空" do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
