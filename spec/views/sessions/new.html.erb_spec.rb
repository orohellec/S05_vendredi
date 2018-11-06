require 'rails_helper'

RSpec.describe "sessions/new", type: :view do
  context 'validation tests' do
  it "check the message if the fields are correct" do
      visit "/sign-up"
      fill_in 'f_name', with: "toto"
      fill_in 'l_name', with: "lito"
      fill_in 'email', with: "toto@test.com"
      fill_in 'password', with: "lala"
      fill_in 'confirm_password', with: "lala"
      click_button 'new_user'

      fill_in 'email', with: "toto@test.com"
      fill_in 'password', with: 'lala'
      click_button 'login'
      expect(page). to have_content 'Vous êtes bien connecté'
    end
    it "check the message if the fields are incorrect" do
        visit "/sign-up"
        fill_in 'f_name', with: "toto"
        fill_in 'l_name', with: "lito"
        fill_in 'email', with: "toto@test.com"
        fill_in 'password', with: "lala"
        fill_in 'confirm_password', with: "lala"
        click_button 'new_user'

        fill_in 'email', with: "toto@test.com"
        fill_in 'password', with: 'la'
        click_button 'login'
        expect(page). to have_content 'Invalid email/password combination'
      end
  end
end
