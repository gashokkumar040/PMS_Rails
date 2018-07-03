json.extract! credit_checker, :id,:user_id,:project_id,:balance,:amount, :created_at, :updated_at
json.url credit_checker_url(credit_checker, format: :json)
