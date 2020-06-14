require 'rails_helper'
feature 'log', type: :feature do
  let(:user) { create(:user) }

  scenario '練習記録の投稿' do
    # ログイン前には投稿ボタンがない
    visit root_path
    expect(page).to have_no_content('投稿')

    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[value="ログインする"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('投稿')

    # 練習記録の投稿
    expect {
      click_link('投稿する')
      expect(current_path).to eq new_log_path
      fill_in 'log[practice_day]', with: '2020/02/01'
      fill_in 'log[serve]', with: '0'
      fill_in 'log[smash]', with: '0'
      fill_in 'log[volley]', with: '0'
      fill_in 'log[stroke]', with: '0'
      fill_in 'log[game]', with: '0'
      find('input[type="submit"]').click
    }.to change(Log, :count).by(1)
  end
end
