require 'rails_helper'

RSpec.describe "user crud functionality", type: :feature do 

    def create_a_list
      visit '/'
      click_on "Create a New List"
      fill_in "list[title]", with: "Grocery Shopping" 
      fill_in "list[description]", with: "Go to Whole Foods" 
      click_on "Add List"
    end

  it "can create a list with a title" do 
    create_a_list

    expect(page).to have_content("Grocery Shopping")
    expect(page).to have_content("Go to Whole Foods" )
  end

  it 'can edit a list title' do 
    create_a_list

    click_on 'Edit'
    fill_in "list[title]", with: "Shoe Shopping" 
    click_on "Update"

    expect(page).to have_content("Shoe Shopping")
    expect(page).to have_content("Go to Whole Foods" )
  end

  it 'can delete a list' do 
    create_a_list
    click_on 'Delete'
    
    expect(page).not_to have_content("Grocery Shopping")
  end

end