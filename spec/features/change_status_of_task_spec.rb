require 'rails_helper'

RSpec.describe 'change status of tasks' do 
  attr_reader :task

  def create_a_list_and_tasks
    list = List.create!(title: "Car shopping")
    @task = Task.create!(title: "Fly to Spain", status: "Incomplete", 
                        start_date: Date.today, list_id: list.id)
    visit lists_path
  end


  xit "changes status from incomplete to completed", js: true do 
    create_a_list_and_tasks
    click_on "Car shopping"
    
    expect(page).to have_content(@task.title)
    find("input[type='checkbox']").set(true)


    expect(page).not_to have_content(task.title)

  end
end