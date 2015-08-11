require 'rails_helper'

RSpec.describe List, type: :model do

  it 'is valid with a title' do
    list = List.create(title: "New list")

    expect(list).to be_valid
  end

  it 'is not valid without a title' do
    list = List.create(title: nil)

    expect(list).not_to be_valid
  end
end
