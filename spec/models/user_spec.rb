require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザ登録が成功する場合' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザ登録に失敗する場合' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含む必要があること。' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'wawawa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'わ12345'
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password = '1234aa'
        @user.password_confirmation = '1234bb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'お名前(全角)は、名字が必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'お名前(全角)は、名前が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'wata'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end

      it '名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'take'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end

      it 'お名前カナ(全角)は、名前がそれぞれ必須であること' do
        @user.kana_first_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank", 'Kana first name 全角カナ文字を使用してください')
      end

      it 'お名前カナ(全角)は、名字が必須であること' do
        @user.kana_last_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank", 'Kana last name 全角カナ文字を使用してください')
      end

      it '名字カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.kana_last_name = '竹'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name 全角カナ文字を使用してください')
      end

      it '名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.kana_first_name = '渉'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name 全角カナ文字を使用してください')
      end

      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date birth can't be blank")
      end
    end
  end
end
