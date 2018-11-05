require 'rails_helper'

RSpec.describe "static_pages/home", type: :view do
#  pending "add some examples to (or delete) #{__FILE__}"
  context 'validation tests' do
    it "unauthentificated user" do
      visit "/"
      within 'header' do
        expect(find('#login')). to have_content("Connectez-vous")
        expect(find('#suscribe')). to have_content("Pas encore inscrit?")
      end
    end
    it "authenticate user" do
      visit "/"
      within 'header' do
        expect(find('#club_list')). to have_content("Club")
        expect(find('#logout')). to have_content("Se déconnecter")
      end
  end
end
