json.extract! meeting, :id, :name, :topic, :meeting_date, :cohort_id, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)