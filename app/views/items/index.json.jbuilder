json.array!(@items) do |item|
  json.extract! item, :id, :name, :description, :category, :picture, :end_time, :user_id
  json.url item_url(item, format: :json)
end
