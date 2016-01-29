json.array!(@categories) do |category|
  json.extract! category, :id, :name
  json.url category_path(category, format: :json)
end
