require 'rails_helper'

RSpec.describe ConditionsSupportsStatus, type: :model do
  before do
    conditions_supports_status = ConditionsSupportsStatus.new(
      condition_id: 1
      support_id: 1
    )
  end

  describe 'validation' do
    it "condition_idとsupport_idがある場合、有効であること" do
      expect(conditions_supports_status).to be_valid
    end
  
    it "condition_idがない場合、無効であること" do
      conditions_supports_status.condition_id = nil
      expect(conditions_supports_status).to be_invalid
      # conditions_supports_status.valid?
      expect(condition_id.errors[:conditions_supports_status]).to include("can't be blank")
    end
    
    it "support_idがない場合、無効であること" do
      conditions_supports_status.support_id = nil
      expect(conditions_supports_status).to be_invalid
      # conditions_supports_status.valid?
      expect(support_id.errors[:conditions_supports_status]).to include("can't be blank")
    end
  end
end