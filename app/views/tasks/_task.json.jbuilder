json.extract! task, :id, :name, :subject, :due_date, :status, :description, :project_id, :created_at, :updated_at
json.url task_url(task, format: :json)
