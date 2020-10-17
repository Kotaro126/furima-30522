require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthdayを入力すれば登録できる" do
      expect(@user).to be_valid
    end

    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailが重複する場合、新規登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが数字のみでは登録できない" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it "passwordがアルファベットのみでは登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "aaa111"
      @user.password_confirmation = "aaa111"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下では登録できないこと" do
      @user.password = "aaa11"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが全角では登録できないこと" do
      @user.password = "aaa１１１"
      @user.password_confirmation = "aaa１１１"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it "passwordとpassword_confirmationが不一致では登録できない" do
      @user.password = "aaa111"
      @user.password_confirmation = "aaa222"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""     
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "first_nameが半角では登録できない" do
      @user.first_name = "aaa"     
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it "last_nameが半角では登録できない" do
      @user.last_name = "aaa"     
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end

    it "first_name_kanaが半角では登録できない" do
      @user.first_name_kana = "aaa"     
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角文字を使用してください")
    end

    it "last_name_kanaが半角では登録できない" do
      @user.last_name_kana = "aaa"     
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角文字を使用してください")
    end

    it "first_name_kanaがカタカナの場合は登録できる" do
      @user.first_name_kana = "オカダ"     
      @user.valid?
      expect(@user).to be_valid
    end

    it "last_name_kanaがカタカナの場合は登録できる" do
      @user.last_name_kana = "タカシ"     
      @user.valid?
      expect(@user).to be_valid
    end

    it "birthdayが空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end