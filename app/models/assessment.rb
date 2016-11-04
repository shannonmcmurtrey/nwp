class Assessment < ApplicationRecord
  has_paper_trail
  belongs_to :individual
end
