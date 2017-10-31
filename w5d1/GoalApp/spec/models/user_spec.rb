require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {FactoryBot.create(:user)}
  describe "user" do
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:password_digest)}
    it { should validate_presence_of(:session_token)}
    it { should validate_length_of(:password).is_at_least(6)}
    it {should have_many(:goals)}
    it {should have_many(:goal_comments).through(:goals)}
  end

  describe "::find_by_credentials" do
    it "finds a user with valid credentials" do
      user
      expect(User.find_by_credentials("user", "password")).to eq(user)
    end

    it "doesn't finds a user with invalid credentials" do
      user
      expect(User.find_by_credentials("user", "password1")).not_to eq(user)
    end
  end
end
