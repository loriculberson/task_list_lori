require 'rails_helper'

RSpec.describe "user", type: :feature do 

  it "can create a list with a title" do 
    visit '/'
    click_on "Create a New List"
    fill_in "list[title]", with: "Grocery Shopping" 
    fill_in "list[description]", with: "Go to Whole Foods" 
    click_on "Add List"
save_and_open_page
    expect(page).to have_content("Grocery Shopping")
    expect(page).to have_content("Go to Whole Foods" )

  end

end