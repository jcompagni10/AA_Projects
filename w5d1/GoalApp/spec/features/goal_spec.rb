require "spec_helper"
require "rails_helper"


feature "goal display-ing" do
  let(:user) {FactoryBot.create(:user)}
  # let(:goal) {Goal.create(title: "my goal", user_id: user.id, public: false)}
  scenario "hides a private goal from other users" do
    Goal.create(title: "my goal", user_id: user.id, public: false)
    visit user_goals_url(user)
    expect(page).not_to have_content("my goal")
  end
end
