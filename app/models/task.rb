class Task < ActiveRecord::Base
  validates :title, :list_id, presence: true
  validate :valid_date_start_date
  validate :valid_date_due_date
  belongs_to :list

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


end
