require 'rails_helper'

RSpec.describe "users/club", type: :view do
  context 'validation tests' do
    it 'check if the page club is not accesible when you are log out' do
      visit '/monclub'
      expect(page).to have_content('Il vous faut créer un compte pour accéder à la liste')
    end
    it 'check if the page return all users' do
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

      visit '/monclub'
      expect(find('#prenom')). to have_content('Prénom')
      expect(find('#nom')). to have_content('Nom')
      expect(find('#email')). to have_content('email')
    end
  end
end
