json.array!(@posts) do |post|
  json.extract! post, :id, :title, :description, :market, :tags
  json.url post_url(post, format: :json)
end
