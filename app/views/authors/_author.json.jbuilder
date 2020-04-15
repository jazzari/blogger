json.extract! author, :id, :user_name, :email, :password, :password_confirmation, :created_at, :updated_at
json.url author_url(author, format: :json)
