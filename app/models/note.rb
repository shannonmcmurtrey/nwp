class Note < ApplicationRecord
  belongs_to :individual
  belongs_to :user
end
