class AddCodeToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :code, :string
  end
end
