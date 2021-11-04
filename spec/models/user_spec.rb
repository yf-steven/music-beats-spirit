require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
    @like = FactoryBot.build(:like)
    @report = FactoryBot.create(:report)
  end

  describe 'ユーザー登録' do

    context '新規登録できる時' do
      it 'nicknameとemail、passwordとpasswort_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do      
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it '重複したnicknameが存在する場合は登録できない' do
        @user.save
        @user2 = FactoryBot.build(:user)
        @user2.nickname = @user.nickname
        @user2.valid?
        expect(@user2.errors.full_messages).to include("ニックネームはすでに存在します")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        @user2 = FactoryBot.build(:user)
        @user2.email = @user.email
        @user2.valid?
        expect(@user2.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

    end
  end

  describe 'liked_by?メソッド' do

    it 'true' do
      @user3 = FactoryBot.create(:user) 
      @like.user = @user3
      @like.report = @report
      @like.save
      expect(@user3.liked_by?(@report.id)).to be(true)
    end

    it 'false' do
      @user4 = FactoryBot.create(:user) 
      @user5 = FactoryBot.create(:user)
      @like.user = @user5
      @like.report = @report
      @like.save
      expect(@user4.liked_by?(@report)).to be(false)
    end

  end

end