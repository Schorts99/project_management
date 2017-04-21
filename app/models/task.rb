class Task < ApplicationRecord
  belongs_to :project

  validates :content, presence: true

  def completed?
    !completed_at.blank?
  end
end
