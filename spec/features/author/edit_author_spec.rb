require 'rails_helper'

describe "Edit author page", type: :feature do
   it "should exist at 'edit_author_path' and render withour error" do
      @alan = FactoryBot.create :author
      visit edit_author_path(@alan)
   end

   it "should have text inputs for an author's first name, last name, and homepage" do
      @alan = FactoryBot.create :author
      visit edit_author_path(@alan)
      expect(page).to have_field('author[first_name]')
      expect(page).to have_field('author[last_name]')
      expect(page).to have_field('author[homepage]')
    end

    it "should save the edited author when data is submitted" do
      @alan = FactoryBot.create :author
      visit edit_author_path(@alan)
      page.fill_in 'author[last_name]', with: 'Dijkstra'
      page.fill_in 'author[first_name]', with: 'Horst'
      page.fill_in 'author[homepage]', with: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
      find('input[type="submit"]').click
    end

    it "should update the information in the database" do
      @author = Author.new(
        first_name: 'Alan',
        last_name: 'Turing',
        homepage: 'http://wikipedia.org/Alan_Turing'
    )
      @author.save
      visit edit_author_path(@author)
        first_names = "Alan Mathison"
        page.fill_in 'author[last_name]', with: 'Turing'
        page.fill_in 'author[first_name]', with: first_names
        page.fill_in 'author[homepage]', with: 'http://wikipedia.de/alan_turing'
        find('input[type="submit"]').click
        @author.reload
        expect(@author.first_name).to eq(first_names)
    end
 end