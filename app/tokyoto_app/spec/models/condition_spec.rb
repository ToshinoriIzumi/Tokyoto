require 'rails_helper'

RSpec.describe Condition, type: :model do
  describe 'validation' do
    it "有効であること" do
      condition = build(:condition)
      expect(condition).to be_valid
    end
  end
end

