class AddOrganizationToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :organization, foreign_key: true
  end
end
