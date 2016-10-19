class AddEducationFieldsToIndividual < ActiveRecord::Migration[5.0]
  def change
    add_column :individuals, :last_grade_completed, :string
    add_column :individuals, :technical_training_degree, :string
    add_column :individuals, :associates_degree_type, :string
    add_column :individuals, :bachelors_degree_type, :string
    add_column :individuals, :masters_degree_type, :string
  end
end
