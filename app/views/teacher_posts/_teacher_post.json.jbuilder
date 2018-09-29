json.extract! teacher_post, :id, :teacher_id, :data, :subcategory, :status, :created_at, :updated_at
json.url teacher_post_url(teacher_post, format: :json)
