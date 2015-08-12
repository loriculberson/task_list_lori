class Task < ActiveRecord::Base
  validates :title, :list_id, presence: true
  validate :valid_date_start_date
  validate :valid_date_due_date
  belongs_to :list
  has_attached_file :image, styles: { medium: "250x170>", thumb: "100x100>" } 
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def valid_date_start_date
    if start_date && start_date.past?
      errors.add(:start_date, "Task start date a can not be set in the past")
    end
  end

  def valid_date_due_date
    if due_date && due_date.past?
      errors.add(:due_date, "Task due date can not be set in the past")
    end
  end

  def self.future_task
    where("start_date >?", Date.today)
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |task|
        csv << task.attributes.values_at(*column_names)
      end
    end
  end


  def self.import(file)
    CSV.foreach(file.tempfile, headers: true ) do |row|
      task_attributes = row.to_hash
      task_attributes.delete(:image)
      Task.create task_attributes
    end
  end
end
