json.extract! audition_request, :id, :actor_id, :role_id, :accepted?, :created_at, :updated_at
json.url audition_request_url(audition_request, format: :json)
