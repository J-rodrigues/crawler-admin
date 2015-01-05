json.array!(@crawlers) do |crawler|
  json.extract! crawler, :id, :site_url, :css_box, :css_nome, :css_preco, :css_url, :loja_id
  json.url crawler_url(crawler, format: :json)
end
