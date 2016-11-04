class Organization < ApplicationRecord
	has_paper_trail
	has_many :users
	has_many :individuals
	has_many :cohorts
	
end
