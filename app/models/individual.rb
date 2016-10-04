class Individual < ApplicationRecord
  belongs_to :cohort

  def self.search(search)
    where("first_name || last_name LIKE ?", "%#{search}%")
  end

end
