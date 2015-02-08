json.array!(@users) do |user|
  json.extract! user, :id, :email
  json.url edit_user_registration_url(user)
end
