require 'rails_helper'

RSpec.describe Condition, type: :model do
  before { condition = Condition.new }

  describe 'validation' do
    it "有効であること" do
      expect(condition).to be_valid
    end
  end
end