json.array!(@alerts) do |alert|
  json.extract! alert, :id, :title, :description, :start, :end, :atype, :user_id
end
