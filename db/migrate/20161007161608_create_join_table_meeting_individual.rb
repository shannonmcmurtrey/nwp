class CreateJoinTableMeetingIndividual < ActiveRecord::Migration[5.0]
  def change
    create_join_table :meetings, :individuals do |t|
      # t.index [:meeting_id, :individual_id]
      # t.index [:individual_id, :meeting_id]
    end
  end
end
