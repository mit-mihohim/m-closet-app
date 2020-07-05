require "rails_helper"
describe User do
  describe "#create" do
    it "nickname, email, password, password_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合、登録できないこと" do
      user = build(:user, nickname:nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "e-mailがない場合、登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "重複したemailが存在する場合、登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordがない場合、登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "password_confirmationが存在しない場合は、登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "passwordとpassword_confirmationが一致しない場合、登録できないこと" do
      user = build(:user, password_confirmation: "00000001")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "passwordが８文字以上であれば、登録できること" do
      user = build(:user, password: "12345678", password_confirmation: "12345678")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが7文字以下であれば、登録できないこと" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      user.valid?
      expect(user.errors[:password]).to include("は8文字以上で入力してください")
    end
  end
end