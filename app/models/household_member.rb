class HouseholdMember < ApplicationRecord
  belongs_to :individual, optional: true
end
