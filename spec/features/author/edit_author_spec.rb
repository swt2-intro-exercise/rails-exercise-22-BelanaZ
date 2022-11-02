require 'rails_helper'

describe "Edit author page", type: :feature do
   it "should exist at 'edit_author_path' and render withour error" do
     visit edit_author_path
   end

   it "should have text inputs for an author's first name, last name, and homepage" do
      visit edit_author_path
      expect(page).to have_field('author[first_name]')
      expect(page).to have_field('author[last_name]')
      expect(page).to have_field('author[homepage]')
    end

    it "should save the edited author when data is submitted" do
      visit edit_author_path
      page.fill_in 'author[last_name]', with: 'Dijkstra'
      page.fill_in 'author[first_name]', with: 'Horst'
      page.fill_in 'author[homepage]', with: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
      find('input[type="submit"]').click
    end

    it "should update the information in the database" do
        visit edit_author_path
        @alan = FactoryBot.create :author
        first_names = "Alan Mathison"
        page.fill_in 'author[last_name]', with: first_names
        page.fill_in 'author[first_name]', with: 'Turing'
        page.fill_in 'author[homepage]', with: 'http://wikipedia.de/alan_turing'
        find('input[type="submit"]').click
        expect(@alan.reload.first_name).to eq(first_names)
    end
 end