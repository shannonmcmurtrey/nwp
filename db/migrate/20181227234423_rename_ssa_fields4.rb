class RenameSsaFields4 < ActiveRecord::Migration[5.2]
  def change
    add_column :assessments, :ssa_community_involvement, :integer
  end
end
