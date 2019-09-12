require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context "validations" do
    it { should validate_presence_of(:content) }
  end
end
