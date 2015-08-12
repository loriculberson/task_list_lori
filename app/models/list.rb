class List < ActiveRecord::Base
  validates :title, presence: true 
  has_many :tasks


  #   def self.import(file)
  #   CSV.parse(file.tempfile, { headers: true }).each do |row|
  #     require 'pry';binding.pry
  #     task_attributes = row.to_hash
  #     task_attributes.delete(:image)
  #     Task.create! task_attributes
  #   end
  # end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |list|
        csv << list.attributes.values_at(*column_names)
      end
    end
  end
end
