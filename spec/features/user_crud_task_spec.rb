require 'rails_helper'

RSpec.describe "CRUD tasks", type: :feature do 
  def create_a_list
    list = List.create(title: "Car shopping")
    visit list_tasks_path(list)
    click_on "New Task"
  end

  def create_a_task
    fill_in "task[title]", with: "Acura MDX"
    fill_in "task[notes]", with: "used with less than 30,000 miles"
    fill_in "task[due_date]", with: "2015-08-15"
    fill_in "task[start_date]", with: Date.today.to_s
    choose "Incomplete"
    click_on 'Create Task'
  end

  it "can create a task that belongs to a list" do 
    create_a_list
    create_a_task
  
    expect(page).to have_content("Acura MDX")
    expect(page).to have_content("used with less than 30,000 miles")
  end

  it "can update a task" do 
    create_a_list
    create_a_task
save_and_open_page
    click_on 'Edit'
    fill_in "task[title]", with: "Chevy Tahoe"
    click_on "Update Task"

    expect(page).to have_content("Chevy Tahoe")
  end

end