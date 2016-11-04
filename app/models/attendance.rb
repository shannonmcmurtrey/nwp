class Attendance < ApplicationRecord
  has_paper_trail
  belongs_to :individual
  belongs_to :meeting
end
