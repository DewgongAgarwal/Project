json.extract! post, :id, :stud_id, :category, :subcategory, :data, :status, :created_at, :updated_at
json.url post_url(post, format: :json)
