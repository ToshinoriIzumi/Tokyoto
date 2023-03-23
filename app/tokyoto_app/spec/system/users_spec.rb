require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user)  { create :user }

  describe '退会処理' do
    before { login(user) }
    xit '退会するを選ぶと退会処理が行われて、トップページにリダイレクトされる' do
      visit profile_path
      expect {
        click_link '退会する'
      }.to change(User, :count).by(-1)

      expect(current_path).to eq top_index_path
      within('header') {
        expect(page).to have_content('新規登録')
      }
    end
  end
end
