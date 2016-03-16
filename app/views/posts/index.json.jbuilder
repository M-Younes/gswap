json.array!(@posts) do |post|
  json.extract! post, :id, :console, :name, :category, :prefered, :image, :user_id, :note, :swaped
  json.url post_url(post, format: :json)
end
