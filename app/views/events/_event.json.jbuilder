json.extract! event, :id, :event_type, :notes, :location, :no_of_days, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
