require 'rails_helper'

RSpec.describe ConditionsSupportsStatus, type: :model do
  before do
    condition = Condition.new
    support = Support.new(
      support_name: 'support1',
      content: 'support1_content',
      url: 'https://www.support1.com',
      )
    conditions_supports_status = ConditionsSupportsStatus.new(
      condition_id: condition.id
      support_id: support.id
    )
  end

  describe 'validation' do
    it "condition_idとsupport_idがある場合、有効であること" do
      expect(conditions_supports_status).to be_valid
    end
  
    it "condition_idがない場合、無効であること" do
      conditions_supports_status.condition_id = nil
      conditions_supports_status.valid?
      expect(conditions_supports_status.errors[:condition_id]).to include("can't be blank")
    end
    
    it "support_idがない場合、無効であること" do
      conditions_supports_status.support_id = nil
      conditions_supports_status.valid?
      expect(conditions_supports_status.errors[:support_id]).to include("can't be blank")
    end
  end
end
