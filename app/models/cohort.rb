class Cohort < ApplicationRecord
  belongs_to :organization
  has_many :individuals
end
