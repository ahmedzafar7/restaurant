json.array!(@orders) do |order|
  json.extract! order, :id, :name, :table, :notes
  json.url order_url(order, format: :json)
end
