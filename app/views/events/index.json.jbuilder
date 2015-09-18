json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :start, :end, :image, :user_id
  json.url event_url(event, format: :json)
end
