# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'JK Rowling'
    fill_in "book[price]", with: '20.0'
    # fill_in "book[published_date]", with: '2025-08-22'
    # Select date from dropdowns
    select '2025', from: 'book_published_date_1i'  # Year
    select 'August', from: 'book_published_date_2i' # Month
    select '22', from: 'book_published_date_3i'     # Day


    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('JK Rowling')
    expect(page).to have_content('20.0')
    expect(page).to have_content('2025-08-22')
  end 
end