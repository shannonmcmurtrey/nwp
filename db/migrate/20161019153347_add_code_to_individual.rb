class AddCodeToIndividual < ActiveRecord::Migration[5.0]
  def change
    add_column :individuals, :code, :string
  end
end
