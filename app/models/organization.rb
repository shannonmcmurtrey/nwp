class Organization < ApplicationRecord
	has_many :users
	has_many :individuals
	has_many :cohorts
	
end
