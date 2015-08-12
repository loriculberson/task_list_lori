require 'rails_helper'

RSpec.describe 'change status of tasks' do 

  def create_a_list_and_tasks
    list = List.create!(title: "Car shopping")
    @task = Task.create!(title: "Fly to Spain", status: "Incomplete", 
                        start_date: Date.today, list_id: list.id)
    visit lists_path
  end


  it "changes status from incomplete to completed", js: true do 
    create_a_list_and_tasks
    click_on "Car shopping"

    within 'table' do
      expect(page).to have_content(@task.title)
      find("input[type='checkbox']").set(true)
    
      expect(page).not_to have_content(@task.title)
    end

    click_on "Completed"
    expect(page).to have_content(@task.title)

  end
end