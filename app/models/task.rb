class Task < ActiveRecord::Base
  validates :title, :list_id, presence: true
  validate :valid_date
  belongs_to :list

  def valid_date
    if start_date && start_date.past? || due_date && due_date.past?
      errors.add(:start_date, "Task start datea can not be set in the past")
      errors.add(:due_date, "Task due date can not be set in the past")
    end
  end
end
