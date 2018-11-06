require 'rails_helper'

RSpec.describe "static_pages/home", type: :view do
#  pending "add some examples to (or delete) #{__FILE__}"
  context 'validation tests' do
    it "unauthentificated user" do
      visit "/"
      within "body" do
        expect(find('p')). to have_content("Il vous faut créer un compte pour accéder à la liste")
      end
      within 'header' do
        expect(find('#login')). to have_content("Connectez-vous")
        expect(find('#suscribe')). to have_content("Pas encore inscrit?")
      end
    end

    it "create new user and check user pages" do
      visit "/sign-up"
      fill_in 'f_name', with: "toto"
      fill_in 'l_name', with: "lito"
      fill_in 'email', with: "toto@test.com"
      fill_in 'password', with: "lala"
      fill_in 'confirm_password', with: "lala"
      click_button 'new_user'

      visit "/login"
      fill_in 'email', with: "toto@test.com"
      fill_in 'password', with: 'lala'
      click_button 'login'

      visit "/"
      within "body" do
        expect(find('#club_link')). to have_content("la fameuse liste!")
      end
      within 'header' do
        expect(find('#club_list')). to have_content("Club")
        expect(find('#logout')). to have_content("Se déconnecter")
      end
    end
  end
end

=begin
    it "authenticate user" do
      visit "/login"
      fill_in 'email', with: "olivier@test.com"
      fill_in 'password', with: 'test'
      click_button 'login'

      visit "/"

      within 'header' do
        expect(find('#login')). to have_content("Connectez-vous")
        expect(find('#suscribe')). to have_content("Pas encore inscrit?")
        expect(find('#club_list')). to have_content("Club")
        expect(find('#logout')). to have_content("Se déconnecter")
      end
    end
=end
