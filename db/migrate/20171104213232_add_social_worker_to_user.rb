class AddSocialWorkerToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :social_worker, :boolean, default: false
  end
end
