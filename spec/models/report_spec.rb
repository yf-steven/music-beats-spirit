require 'rails_helper'

RSpec.describe Report, type: :model do
  describe 'レポート投稿' do
    before do
      @report = FactoryBot.build(:report)
    end

    context 'レポート投稿できる時' do
      it 'title、artist、text、violent、with_family、preparationを正しく入力するとレポート投稿できる' do
        expect(@report).to be_valid
      end
    end

    context 'レポート投稿できない時' do
      it 'titleが空では投稿できない' do
        @report.title = ''
        @report.valid?
        expect(@report.errors.full_messages).to include("タイトルを入力してください")
      end
      it 'artistが空では投稿できない' do
        @report.artist = ''
        @report.valid?
        expect(@report.errors.full_messages).to include("アーティストを入力してください")
      end
      it 'textが空では投稿できない' do
        @report.text = ''
        @report.valid?
        expect(@report.errors.full_messages).to include("本文を入力してください")
      end
      it 'violentが空では投稿できない' do
        @report.violent = ''
        @report.valid?
        expect(@report.errors.full_messages).to include("激しさの評価は星0.5以上を選んでください")
      end
      it 'with_familiyが空では投稿できない' do
        @report.with_family = ''
        @report.valid?
        expect(@report.errors.full_messages).to include("オススメの評価は星0.5以上を選んでください")
      end
      it 'prepatationが空では投稿できない' do
        @report.preparation = ''
        @report.valid?
        expect(@report.errors.full_messages).to include("予習必要度の評価は星0.5以上を選んでください")
      end
      it 'reportがuserと紐づいていないと投稿できない' do
        @report.user = nil
        @report.valid?
        expect(@report.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
