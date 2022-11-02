require 'rails_helper'

RSpec.describe "papers/edit", type: :view do
  let(:paper) {
    Paper.create!(
      title: "MyString",
      venue: "MyString",
      year: 1
    )
  }

  before(:each) do
    assign(:paper, paper)
  end

  it "renders the edit paper form" do
    render

    assert_select "form[action=?][method=?]", paper_path(paper), "post" do

      assert_select "input[name=?]", "paper[title]"

      assert_select "input[name=?]", "paper[venue]"

      assert_select "input[name=?]", "paper[year]"
    end
  end

  it "should exist at 'edit_paper_path' and render withour error" do
    visit edit_paper_path(paper)
 end

 it "should have text inputs for an papers's title, venue and year" do
    visit edit_paper_path(paper)
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end

  it "should save the edited paper when data is submitted" do
    visit edit_paper_path(paper)
    page.fill_in 'paper[title]', with: 'a Title'
    page.fill_in 'paper[venue]', with: 'venue'
    page.fill_in 'paper[year]', with: '1200'
    find('input[type="submit"]').click
  end

  it "should update the information in the database" do
    visit edit_paper_path(paper)
      title = "new title"
      page.fill_in 'paper[title]', with: title
      find('input[type="submit"]').click
      paper.reload
      expect(paper.title).to eq(title)
  end
end
