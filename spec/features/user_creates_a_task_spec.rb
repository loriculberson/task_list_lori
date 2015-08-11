require 'rails_helper'

RSpec.describe "users add tasks to lists", type: :feature do 
  def create_a_list
    list = List.create(title: "Car shopping")
    visit list_tasks_path(list)
  end

  it "adds a task" do 
    create_a_list

    click_on "New Task"

    fill_in "task[title]", with: "Acura MDX"
    fill_in "task[notes]", with: "used with less than 30,000 miles"
    fill_in "task[due_date]", with: "2015-08-15"
    fill_in "task[start_date]", with: "2015-08-11"
    choose "Incomplete"
    click_on 'Create Task'

    expect(page).to have_content("Acura MDX")
    expect(page).to have_content("used with less than 30,000 miles")
  end

end