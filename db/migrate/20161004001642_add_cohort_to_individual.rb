class AddCohortToIndividual < ActiveRecord::Migration[5.0]
  def change
    add_reference :individuals, :cohort, foreign_key: true
  end
end
