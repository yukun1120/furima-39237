require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it "すべての項目が適切に存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it "imageが空では出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが40文字より多いと出品できない" do
        @item.name = "あ" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it "explanationが空では出品できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "explarationが1000文字より多いと出品できない" do
        @item.explanation = "あ" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation is too long (maximum is 1000 characters)")
      end
      it "category_idが1だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category catn't be blank")
      end
      it "status_idが1だと出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status catn't be blank")
      end
      it "postage_idが1だと出品できない" do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage catn't be blank")
      end
      it "region_idが1だと出品できない" do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region catn't be blank")
      end
      it "schedule_idが1だと出品できない" do
        @item.schedule_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule catn't be blank")
      end
      it "priceが空だと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299以下だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが10000000以上だと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceが半角数字以外の文字が入っていると出品できない" do
        @item.price = "1あAa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "ユーザー情報が紐付いていない場合" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end