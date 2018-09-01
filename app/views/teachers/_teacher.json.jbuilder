json.extract! teacher, :id, :firstname, :lastname, :email, :school, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
