require 'rails_helper'

RSpec.describe Task, type: :model do

  context "task with valid attributes" do 

    it "is valid with all attributes" do 
      task = Task.create!(title: "Visit the beach", status: "Incomplete", 
                          notes: "Bring sunscreen", start_date: "Sun, 18 Aug 2015",
                          due_date: "Sat, 22 Aug 2015", list_id: 1)

      expect(task).to be_valid
    end
  end

  context "task with invalid attributes" do 

    it "is not valid without a title" do 
      task = Task.new(title: nil, status: "Incomplete", 
                         start_date: "Sun, 16 Aug 2015",
                          due_date: "Sat, 22 Aug 2015", list_id: 2)

      expect(task).not_to be_valid
    end

    it "is not valid when the start date is set in the past" do 
      task = Task.new(title: "Go for a long run", status: "Incomplete", 
                         start_date: "Sun, 09 Aug 2015",
                          due_date: "Sat, 22 Aug 2015", list_id: 1)

      expect(task).not_to be_valid
    end

    it "is not valid when the due date is set in the past" do 
      task = Task.new(title: "Go for a long run", status: "Incomplete", 
                         start_date: "Sun, 22 Aug 2015",
                          due_date: "Sat, 08 July 2015", list_id: 1)

      expect(task).not_to be_valid
    end
  end
end
