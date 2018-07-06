module ProjectsHelper
  def projects_for_show
    Project.all.collect { |p| [p.project_title, p.project_description,p.id] }    
  end

  def approval_date
    Project.where("approved = ? AND approved_at =? ",true,Time.now)
  end

end
