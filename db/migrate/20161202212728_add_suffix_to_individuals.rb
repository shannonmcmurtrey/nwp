class AddSuffixToIndividuals < ActiveRecord::Migration[5.0]
  def change
    add_column :individuals, :suffix, :string
  end
end
