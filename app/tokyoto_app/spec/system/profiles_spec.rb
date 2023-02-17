require 'rails_helper'

RSpec.describe "Profiles", type: :system do
  let(:user)  { create :user }
  let(:user_with_profile)  { create :user, :with_profile }

  describe 'プロフィール新規登録' , js: true do
    before do
     login(user)
     FactoryBot.create(:city, city_name: '新宿区')
    end

    context '成功系', js: true do
      it '収入に100と入力すると1,000,000で登録されて100万円と表示される' do
        visit new_profile_path

        find("#profile_form_city_id").select("新宿区")
        fill_in 'profile_form[income]', with: '100'
        find("#birth_0").set('2022/01/01')
        click_button '登録する'
        
        expect(current_path).to eq root_path
        expect(page).to have_content('プロフィールを登録しました')
      
        visit profile_path
        expect(page).to have_content('住んでいる地域 新宿区')
        expect(page).to have_content('収入（単位：万円）100万円')
        expect(page).to have_content('子供の生年月日 2022-01-01')
      end

      xit '子供を2人(2021/01/01, 2022/01/01)追加すると子供の生年月日に2021-01-01 2022-01-01が表示される' do
        visit new_profile_path
        
        find('#child-birth-input-plus').click
        sleep 0.5
        find("#profile_form_city_id").select("新宿区")
        fill_in 'profile_form[income]', with: '100'
        find("#birth_0").set('2021/01/01')
        find("#birth_1").set('2022/01/01')
        click_button '登録する'
      
        visit profile_path
        expect(page).to have_content('子供の生年月日 2021-01-01 2022-01-01')
      end
    end
  end
  
  describe 'プロフィール編集画面' do
    before do 
      login(user_with_profile)
      FactoryBot.create(:city, city_name: '新宿区')
    end
    
    context '成功系' do
      it '収入に500と入力すると5,000,000で更新されて500万円と表示される' do
        visit edit_profile_path
        fill_in 'profile_form[income]', with: '500'
        click_button '登録する'
        
        expect(current_path).to eq profile_path
        expect(page).to have_content('プロフィールを更新しました')        
        expect(page).to have_content('収入（単位：万円）500万円')
      end

      it '子供の生年月日に2022/01/10を変更したら更新されて2022-01-10と表示される' do
        visit edit_profile_path
        find("#birth_0").set('2022/01/10')
        click_button '登録する'

        expect(current_path).to eq profile_path
        expect(page).to have_content('プロフィールを更新しました')        
        expect(page).to have_content('子供の生年月日 2022-01-10')
      end
    end
  end
end