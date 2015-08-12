require 'active_support/all'

class Seed

  def call
    generate_lists
    generate_tasks
  end

  def generate_lists
    List.create(title: "Events", description: Faker::Lorem.sentence)
    List.create(title: "Phone Book", description: Faker::Lorem.sentence )
    List.create(title: "Races & Adventures", description:Faker::Lorem.sentence)
    List.create(title: "When I Can Sit and Watch TV", description: Faker::Lorem.sentence)
    List.create(title: "Travel Destinations", description: Faker::Lorem.sentence )
    List.create(title: "Shopping Lists", description: Faker::Lorem.sentence)
    List.create(title: "Christmas List. Who's been naughty and nice?", description: Faker::Lorem.sentence)
    List.create(title: "Books", description: Faker::Lorem.sentence )
    List.create(title: "Music Play List", description: Faker::Lorem.sentence )

    p 'Lists Created'
  end

  def generate_tasks
    list_count = List.count
    status_val = ["Completed", "Incomplete"]
    date_range = rand(1..30)
    num = (1..list_count).to_a

    40.times do
      Task.create(title: Faker::Commerce.product_name, 
        notes: Faker::Company.catch_phrase, 
        start_date: Faker::Time.between(DateTime.now, DateTime.now + 5),
        due_date: Faker::Date.between(6.days.from_now, 50.days.from_now), 
        status: status_val.sample,
        list_id: num.sample )
    end

    40.times do
      Task.create!(title: Faker::Commerce.product_name, 
        notes: Faker::Company.catch_phrase, 
        start_date: Time.now,
        due_date: Faker::Date.between(6.days.from_now, 50.days.from_now), 
        status: status_val.sample,
        list_id: num.sample )
    end

    p 'Tasks Created'
  end

  def self.call
      new.call
    end
  end

Seed.call