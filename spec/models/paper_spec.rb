require 'rails_helper'

describe "New paper page", type: :model do
  it "should create a new instance" do
    title = 'My paper'
    venue = 'Mars'
    year = 2002
    paper = Paper.new(:title => title, :venue => venue, :year => year)
    expect(paper.title).to eq(title)
    expect(paper.venue).to eq(venue)
    expect(paper.year).to eq(year)    
  end
end