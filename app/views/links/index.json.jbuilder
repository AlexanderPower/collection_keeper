json.array!(@links) do |link|
  json.extract! link, :id, :text, :collection_id
  json.url link_url(link, format: :json)
end
