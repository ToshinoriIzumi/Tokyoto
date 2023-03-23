require 'rails_helper'

RSpec.describe ConditionsSupportsStatus, type: :model do
  describe 'validation' do
    it "condition_idとstatus_idがある場合、有効であること" do
      conditions_supports_status = build(:conditions_supports_status)
      expect(conditions_supports_status).to be_valid
    end
    
    it "condition_idがない場合、無効であること" do
      conditions_supports_status = build(:conditions_supports_status, condition_id: nil)
      conditions_supports_status.valid?
      expect(conditions_supports_status.errors[:condition]).to include("を入力してください")
    end
    
    it "status_idがない場合、無効であること" do
      conditions_supports_status = build(:conditions_supports_status, status_id: nil)
      conditions_supports_status.valid?
      expect(conditions_supports_status.errors[:status]).to include("を入力してください")
    end
  end
end
