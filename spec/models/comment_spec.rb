require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'comment投稿' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context 'commentを投稿できる時' do
      it 'textを入力し、userとreportと紐づいていると投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'commentを投稿できない時' do
      it 'textが空の時は投稿できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("コメントを入力してください")
      end
    end
  end
end
