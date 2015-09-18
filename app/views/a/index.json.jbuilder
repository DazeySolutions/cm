json.events do
    json.array!(@events) do |event|
        json.extract! event, :id, :title, :description, :start, :end, :image, :url
    end
end

json.sermons do
    json.array!(@sermons) do |sermon|
        json.extract! sermon, :id, :title, :description, :start, :end, :image
    end
end

json.alerts do
    json.array!(@alerts) do |alert|
        json.extract! alert, :id, :title, :description, :start, :end, :atype
    end
end
