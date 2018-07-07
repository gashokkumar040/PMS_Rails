desc "Explaining what the task does"
task :rails_admin_charts do
  # Task goes here
  Project.where("approved= ? AND user_id=?",true,@object.id)
end