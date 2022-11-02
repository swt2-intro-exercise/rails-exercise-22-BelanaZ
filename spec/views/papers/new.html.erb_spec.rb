require 'rails_helper'

RSpec.describe "papers/new", type: :view do
  before(:each) do
    assign(:paper, Paper.new(
      title: "MyString",
      venue: "MyString",
      year: 1
    ))
  end

  it "should exist at 'new_paper_path' and render withour error" do
    visit new_paper_path
  end

  it "renders new paper form" do
    render

    assert_select "form[action=?][method=?]", papers_path, "post" do

      assert_select "input[name=?]", "paper[title]"

      assert_select "input[name=?]", "paper[venue]"

      assert_select "input[name=?]", "paper[year]"
    end
  end

  it "should display 'error' after invalid input" do
    visit new_paper_path
    page.fill_in 'paper[title]', with: ''
    page.fill_in 'paper[venue]', with: 'Paris'
    page.fill_in 'paper[year]', with: '1999'
    find('input[type="submit"]').click
    expect(page).to have_text 'error'
  end
end
