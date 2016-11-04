class User < ApplicationRecord
	has_paper_trail
	belongs_to :organization
	has_one :individual
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    self.admin
  end

end
