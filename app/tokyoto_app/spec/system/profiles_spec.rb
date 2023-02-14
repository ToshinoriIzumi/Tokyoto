require 'rails_helper'

RSpec.describe "Profiles", type: :system do
  let(:user)  { create :user }
  let(:user_with_profile)  { create :user, :with_profile }

  describe 'プロフィール新規登録' do
    before { login(user) }

    context '成功系' do
      xit '収入に100と入力すると1,000,000で登録されて100万円と表示される' do
        visit new_profile_path
        expect {
          fill_in 'user[user_name]', with: 'テス夫'
          # どうやっても探し当ててくれません
          # find("#user_city_id").find("新宿区").select_option
          fill_in 'user[income]', with: '100'
          fill_in 'user[children_attributes][0][age]', with: '10'
          click_button '登録する'
        }.to change { user.reload.income }.to 1000000
        
        expect(current_path).to eq root_path
        expect(page).to have_content('プロフィール情報を登録しました')
        within('header') { click_link "テス夫さん" }
        
        expect(current_path).to eq profile_path
        expect(page).to have_content('収入100万円')
      end
    end
  end
  
  describe 'プロフィール編集画面' do
    before { login(user_with_profile) }
    
    context '成功系' do
      xit '収入に500と入力すると5,000,000で更新されて500万円と表示される' do
        visit edit_profile_path
        expect {
          fill_in 'user[income]', with: '500'
          click_button '更新する'
        }.to change { user_with_profile.reload.income }.to 5000000
        
        expect(current_path).to eq profile_path
        expect(page).to have_content('プロフィールを更新しました')        
        expect(page).to have_content('収入500万円')
      end
    end
  end
end