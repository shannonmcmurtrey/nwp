class Cohort < ApplicationRecord
  has_paper_trail
  belongs_to :organization
  has_many :individuals

  def to_label
    "#{meeting_night} #{meeting_time} #{organization.name}"
  end
end
