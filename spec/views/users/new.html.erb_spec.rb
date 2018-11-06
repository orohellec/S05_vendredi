require 'rails_helper'

RSpec.describe "users/new", type: :view do
  context 'validation tests' do
    it "check the view if the form is incorrect" do
      visit "/sign-up"
      fill_in 'f_name', with: "toto"
      fill_in 'l_name', with: "lito"
      fill_in 'email', with: "toto@test.com"
      fill_in 'password', with: "lala"
      fill_in 'confirm_password', with: "lala"
      click_button 'new_user'

      visit "/sign-up"
      fill_in 'f_name', with: "toto"
      fill_in 'l_name', with: "lito"
      fill_in 'email', with: "toto@test.com"
      fill_in 'password', with: "lala"
      fill_in 'confirm_password', with: "lala"
      click_button 'new_user'
      expect(page). to have_content 'Champs incorrectes'
    end
    it "check the view if the form is correct" do
      visit "/sign-up"
      fill_in 'f_name', with: "toto"
      fill_in 'l_name', with: "lito"
      fill_in 'email', with: "toto@test.com"
      fill_in 'password', with: "lala"
      fill_in 'confirm_password', with: "lala"
      click_button 'new_user'
      expect(page). to have_content 'Votre compte à bien été créé'
    end
  end
end
