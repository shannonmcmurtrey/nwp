class Attendance < ApplicationRecord
  belongs_to :individual
  belongs_to :meeting
end
