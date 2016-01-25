json.array!(@foods) do |food|
  json.extract! food, :id, :title, :description, :image_url, :price
  json.url food_url(food, format: :json)
end
