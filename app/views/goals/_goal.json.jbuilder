json.extract! goal, :id, :individual_id, :goal, :goal_start, :goal_finish, :completion_percentage, :created_at, :updated_at
json.url goal_url(goal, format: :json)