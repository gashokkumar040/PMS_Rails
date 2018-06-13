module ProjectsHelper
  def projects_for_show
    Project.all.collect { |p| [p.project_title, p.project_description,p.id] } 
    
  end
end
