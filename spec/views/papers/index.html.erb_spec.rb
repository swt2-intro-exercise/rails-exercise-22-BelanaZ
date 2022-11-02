require 'rails_helper'

RSpec.describe "papers/index", type: :view do
  before(:each) do
    assign(:papers, [
      Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      ),
      Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      )
    ])
  end

  it "renders a list of papers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Venue".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end

  it "has Edit button" do
    visit papers_path
    expect(page).to have_link("Edit")
  end

  it "has delete button" do
    visit papers_path
    expect(page).to have_link("Delete")
end

it "allows deleting the author" do
    @paper = Paper.new(
        title: 'hi',
        venue:'venue',
        year: 2
    )
    @paper.save
    visit papers_path(@paper)
    count_before = Paper.count
    click_link("Delete")
    expect(Paper.count).to eq count_before -1  
end
end
