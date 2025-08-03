json.extract! resource, :id, :title, :author, :category, :status, :created_at, :updated_at
json.url resource_url(resource, format: :json)
