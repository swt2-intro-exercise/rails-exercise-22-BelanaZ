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
    end
 end