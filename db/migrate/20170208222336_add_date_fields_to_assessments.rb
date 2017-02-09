class AddDateFieldsToAssessments < ActiveRecord::Migration[5.0]
  def change
    add_column :assessments, :drug_date_of_last_use_ccs, :date
    add_column :assessments, :drug_date_of_last_use_meth, :date
    add_column :assessments, :drug_date_of_last_use_marijuana, :date
    add_column :assessments, :drug_date_of_last_use_heroin, :date
    add_column :assessments, :drug_date_of_last_use_other, :date
  end
end
