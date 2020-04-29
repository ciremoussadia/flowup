require 'rails_helper'

feature 'Competitors Subscription' do
  scenario 'with valid data' do
    visit root_path
    fill_in "Nom", with: "Matador"
    fill_in "Adresse", with: "Thiaroye"
    fill_in "Age", with: 45
    fill_in "Tél", with: "775185901"
    fill_in "E-mail", with: "matador@gmail.com"
    attach_file("Song MP3", Rails.root + "spec/fixtures/mysong.mp3")

    click_on "S'inscrire"

    expect(page).to have_content('Inscription enregistrée')
    
  end
end