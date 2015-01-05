json.array!(@produtos) do |produto|
  json.extract! produto, :id
  json.url produto_url(produto, format: :json)
end
