require 'rails_helper'

describe "Showing author page", type: :feature do
    it "renders without error" do
        @alan = FactoryBot.create :author
        visit author_path(@alan)
    end    
  
    it "should have first and last name and homepage as text" do
        @alan = FactoryBot.create :author
        visit authors_path(@alan)
        expect(page).to have_text('Alan')
        expect(page).to have_text('Turing')
        expect(page).to have_text('http://wikipedia.de/alan_turing')
    end

    it "has delete button" do
        @alan = FactoryBot.create :author
        visit authors_path(@alan)
        expect(page).to have_link('Delete')
    end

    it "allows deleting the author" do
        @author = Author.new(
            first_name: 'Alan',
            last_name: 'Turing',
            homepage: 'http://wikipedia.org/Alan_Turing'
        )
        @author.save
        visit authors_path(@author)
        count_before = Author.count
        click_link("Delete")
        expect(Author.count).to eq count_before -1  
    end
 end