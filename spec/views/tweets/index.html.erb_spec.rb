require 'rails_helper'

RSpec.describe "tweets/index", type: :view do
  let!(:user) { FactoryBot.create(:user) }
  let!(:tweet1) { FactoryBot.create(:tweet, user: user)}
  let!(:tweet2) { FactoryBot.create(:tweet, user: user)}

  it "renders a list of tweets" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
