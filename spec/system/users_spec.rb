require 'rails_helper'

RSpec.describe "Users", type: :system do
  it 'ログインしていない状態でトップページにアクセスした場合、サインインページに移動する' do
    #トップページに遷移する
    visit root_path
    #ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq(new_user_session_path)
  end

  it 'ログインに成功し、トップページに遷移する' do
    # 予め、ユーザーをDBに保存する
      @user = FactoryBot.create(:user)
    # サインインページへ移動する
      visit new_user_session_path
    # ログインしていない場合、サインインページに遷移していることを確認する
      expect(current_path).to eq(new_user_session_path)
    # すでに保存されているユーザーのemailとpasswordを入力する
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    # ログインボタンをクリックする
      click_on ('Log in')
    # トップページに遷移していることを確認する
      expect(current_path).to eq(root_path)
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    #予め、ユーザーをDBに保存する
      @user = FactoryBot.create(:user)
    #トップページに遷移する
      visit root_path
    #ログインしていない場合、サインインページに遷移することを確認する
      expect(current_path).to eq(new_user_session_path)
    #間違ったユーザー情報を入力する
      fill_in 'Email', with: 'aaaa'
      fill_in 'Password', with: 'aaaa'
    #ログインボタンをクリックする
      click_on ('Log in')
    #サインインページに戻っていることを確認する
      expect(current_path).to eq(new_user_session_path)
  end
end
