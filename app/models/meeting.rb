class Meeting < ApplicationRecord
  belongs_to :cohort
  has_and_belongs_to_many :individuals
end
