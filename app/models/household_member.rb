class HouseholdMember < ApplicationRecord
  has_paper_trail
  belongs_to :individual, optional: true
end
