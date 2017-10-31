require 'rails_helper'

RSpec.describe GoalsController, type: :controller do



  describe "mark as complated" do
    let(:user) {FactoryBot.create(:user)}
    let(:goal) {Goal.new(title: "my goal", user_id: user.id, public: false)}
    it "marks a goal as complated" do
      goal.mark_as_completed
      expect(goal.completed).to be true
    end
  end



end
