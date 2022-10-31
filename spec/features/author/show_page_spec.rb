require 'rails_helper'

describe "Showing author page", type: :feature do
  
    it "should have first and last name and homepage as text" do
        visit author_path(@alan)
        expect(page).to have_text('Alan')
        expect(page).to have_text('Turing')
        expect(page).to have_text('http://wikipedia.org/Alan_Turing')
    end
 end