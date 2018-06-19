class ProjectsController < ApplicationController
  
  prepend_before_action :authorize_user!
  prepend_before_action :authenticate_user!
  prepend_before_action :set_project, only: [:show, :edit, :update, :destroy]


  
  # GET /projects
  # GET /projects.json
  def index
    #@projects = Project.all
    #@projects = current_user.projects
    ###
    #@projects = current_user.projects unless current_user.nil?
    ###
    #if params
    #@project = current_user.projects.create(project_params)
    # if current_user.tasks.empty?
    #   respond_to do |format|
    #     format.html{ redirect_to new_project_task_path(Project.ids), :danger=>'You are not yet created any projects and tasks...'}
    #   end
    # else 
      ###
      @task = current_user.tasks.find_by(params[:project_id]) unless current_user.tasks.nil?
      #@credit = current_user.credit_checkers.find_by(param[:project_id]) unless current_user.credit_checkers.nil?
      ###
    # end
    #@task = current_user.tasks.find_by(params[:project_id])
    #================
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    #@project = Project.find(params[:id])
    #@tasks = @project.tasks
    @projects = current_user.projects
    #================
    @tasks = @project.tasks unless current_user .nil?
     #================
  end

  # GET /projects/new
  def new
    #@project = Project.new
    #================
    @project = current_user.projects.new
    #================
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    #@project = Project.new(project_params)

    #==============
    @project = current_user.projects.create(project_params)
    #==============
    @project.user_id = current_user.id

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end

    #==============
    #  @project = current_user.projects.create(project_params)

    # if @project.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
    #================


  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|

      #@project.user_id = current_user.id

        #validate_approval
      if params[:approved => true]
        current_user.params[:credits] += 1; 
      end

      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  private
  def set_project
    #@project = Project.find(params[:id])

  begin
    @project = Project.find(params[:id]) #raises an exception if project not found        
  rescue ActiveRecord::RecordNotFound
    redirect_to projects_path
  end

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:project_id, :project_title, :project_description, :user_id,:organization_id,:asset, :approved)
  end

  def find_project
    current_user.projects.where(:user_id => params[:user_id]).first
  end

  def authorize_user!
    return unless !current_user
    redirect_to root_path, alert: 'current users only!'
  end


end
