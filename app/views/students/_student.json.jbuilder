json.extract! student, :id, :firstname, :lastname, :email, :school, :created_at, :updated_at
json.url student_url(student, format: :json)
