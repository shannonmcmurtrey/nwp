class AddOrganizationToIndividual < ActiveRecord::Migration[5.0]
  def change
    add_reference :individuals, :organization, foreign_key: true
  end
end
