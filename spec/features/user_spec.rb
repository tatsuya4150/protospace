require 'rails_helper'

feature 'sign-up' do
  let!(:user) {create :user}
  let!(:prototype) { build :prototype }
  def sign_up
    visit new_user_registration_path
    fill_in "Username", with: "Example user"
    fill_in "E-Mail", with: "a@a.com"
    fill_in "Password", with: "00000000"
    fill_in "Member", with: "tcamp"
    fill_in "Profile", with: "hi"
    fill_in "Works", with: "engineer"
    click_on 'Save'
  end

  def sign_in
    visit new_user_session_path
    fill_in "Email address", with: user.email
    fill_in "Password", with: user.password
    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'sign_up' do
    sign_up
  end

  scenario 'sign_in' do
    sign_in
  end

  def prototype_post
    sign_in
    click_on 'New Proto'
    fill_in "Title", with: prototype.title
    attach_file "prototype[images_attributes][0][image]", "#{Rails.root}/spec/fixtures/img/sample.png"
    3.times do |i|
      attach_file "prototype[images_attributes][#{i}][image]", "#{Rails.root}/spec/fixtures/img/sample.png"
    end
    fill_in "Catch Copy", with: prototype.catch_copy
    fill_in "Concept", with: prototype.concept
    click_on "Publish"
    expect(page).to have_content '投稿完了しました'
  end

  scenario 'prototype_post' do
    prototype_post
  end
end

