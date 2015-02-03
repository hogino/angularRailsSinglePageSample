json.array!(@users) do |user|
  json.extract! user, :id, :name
  json.url user_url(user)
end
