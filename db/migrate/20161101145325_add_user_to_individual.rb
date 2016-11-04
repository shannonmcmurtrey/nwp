class AddUserToIndividual < ActiveRecord::Migration[5.0]
  def change
    add_reference :individuals, :user, foreign_key: true
  end
end
