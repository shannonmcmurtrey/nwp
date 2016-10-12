class Meeting < ApplicationRecord
  belongs_to :cohort
  has_many :attendances
  has_and_belongs_to_many :individuals
end
