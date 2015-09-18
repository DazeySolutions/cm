json.array!(@sermons) do |sermon|
  json.extract! sermon, :id, :title, :description, :start, :end, :image, :user
  json.url sermon_url(sermon, format: :json)
end
