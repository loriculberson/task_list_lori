require 'rails_helper'

RSpec.describe "tasks view", type: :feature do 

  it "can only  see tasks that are INCOMPLETE and start date is before today" do
    list = List.create!(title: "Car shopping")
    task = Task.create!(title: "Fly to Spain", status: "Completed", 
                        start_date: Date.today, list_id: list.id)
    task2 = Task.create!(title: "Visit the beach", status: "Incomplete", 
                        start_date: Date.today, list_id: list.id)

    visit lists_path
    click_on "Car shopping"

    expect(page).to have_content("Visit the beach")
    # expect(page).not_to have_content("Fly to Spain")
  end

  it "can see COMPLETED tasks" do
    list = List.create!(title: "Travel")
    task = Task.create!(title: "Fly to Spain", status: "Completed", 
                        start_date: "Mon, 17 Aug 2015", list_id: list.id)
    task2 = Task.create!(title: "Visit the beach", status: "Incomplete", 
                        start_date: "Tue, 18 Aug 2015", list_id: list.id)

    visit lists_path
    click_on "Travel"
    click_on "Completed Tasks"

    expect(page).to have_content("Fly to Spain")
  end

  it "can see tasks with FUTURE dates tasks" do
    list = List.create(title: "Travel")
    task = Task.create(title: "Fly to Spain", status: "Completed", 
                        start_date: "Mon, 17 Aug 2015", list_id: list.id,
                        due_date: "Mon, 17 Aug 2015")

    task2 = Task.create(title: "Visit the beach", status: "Incomplete", 
                        start_date: "Tue, 18 Aug 2015", list_id: list.id,
                        due_date: "Wed, 19 Aug 2015")

    task3 = Task.create(title: "Road Trip", status: "Incomplete", 
                        start_date: "Sun, 09 Aug 2015", list_id: list.id,
                        due_date: "Wed, 19 Aug 2015")


    visit lists_path
    click_on "Travel"
    click_on "Future Tasks"

    expect(page).to have_content("Fly to Spain")
    expect(page).to have_content("Visit the beach")
    expect(page).not_to have_content("Road Trip")
  end

end
