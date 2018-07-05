class Task < ApplicationRecord
  belongs_to :project

  validates :name, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :time_validation

  def time_validation
    errors.add(:start_time, 'must be earlier than end time') if
    self.start_time > self.end_time
  end
    
end
