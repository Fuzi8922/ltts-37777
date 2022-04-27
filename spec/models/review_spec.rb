require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe 'レビューの投稿' do
    context '投稿できるとき' do
      it '製品名、レビューテキスト、価格帯、カテゴリ、評価が正しく存在すれば登録できる' do
        expect(@review).to be_valid
      end
    end

    context '投稿できないとき' do
      it 'userが紐付いていないと出品できない' do
        @review.user = nil
        @review.valid?
        expect(@review.errors.full_messages).to include 'User must exist'
      end

      it '製品画像がないと登録できない' do
        @review.image = nil
        @review.valid?
        expect(@review.errors.full_messages).to include "Image can't be blank"
      end

      it '製品名がないと登録できない' do
        @review.item = ''
        @review.valid?
        expect(@review.errors.full_messages).to include "Item can't be blank"
      end

      it '製品名が50文字より多いと登録できない' do
        @review.item = 'a' * 51
        @review.valid?
        expect(@review.errors.full_messages).to include "Item is too long (maximum is 50 characters)"
      end

      it 'レビューテキストがないと登録できない' do
        @review.review_text = ''
        @review.valid?
        expect(@review.errors.full_messages).to include "Review text can't be blank"
      end

      it 'レビューテキストが10文字より少ないと登録できない' do
        @review.review_text = 'a' * 9
        @review.valid?
        expect(@review.errors.full_messages).to include "Review text is too short (minimum is 10 characters)"
      end

      it 'レビューテキストが1000文字より多いと登録できない' do
        @review.review_text = 'a' * 1001
        @review.valid?
        expect(@review.errors.full_messages).to include "Review text is too long (maximum is 1000 characters)"
      end

      it '価格帯がないと登録できない' do
        @review.price_range_id = nil
        @review.valid?
        expect(@review.errors.full_messages).to include "Price range can't be blank"
      end

      it '価格帯のidが1だと登録できない' do
        @review.price_range_id = 1
        @review.valid?
        expect(@review.errors.full_messages).to include "Price range can't be blank"
      end

      it 'カテゴリのidがないと登録できない' do
        @review.category_id = nil
        @review.valid?
        expect(@review.errors.full_messages).to include "Category can't be blank"
      end

      it 'カテゴリのidが1だと登録できない' do
        @review.category_id = 1
        @review.valid?
        expect(@review.errors.full_messages).to include "Category can't be blank"
      end

      it '評価のidがないと登録できない' do
        @review.evaluation_id = nil
        @review.valid?
        expect(@review.errors.full_messages).to include "Evaluation can't be blank"
      end

      it '評価のidが1だと登録できない' do
        @review.evaluation_id = 1
        @review.valid?
        expect(@review.errors.full_messages).to include "Evaluation can't be blank"
      end
    end
  end
end
