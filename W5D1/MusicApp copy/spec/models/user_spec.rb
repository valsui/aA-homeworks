require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do
    subject(:user) do
      FactoryBot.build(:user, email: '123abc@email.com', password: 'okiedokie')
    end


    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }

    it "makes a password_digest when password if given" do
      expect(user.password_digest).to_not be_nil
    end

    it "resets a session token" do
      exepect(user.session_token).to_not eq(user.reset_session_token!)
    end

    context "when logging in" do
      it "finds user by credentials if valid" do
        expect(User.find_by_credentials('123abc@email.com', 'okiedokie')).to eq(user)
      end

      it "returns nil if credentials are invalid" do
        expect(User.find_by_credentials('123abc@email.com', 'okaycookies')).to eq(user)
      end
    end
  end
end
