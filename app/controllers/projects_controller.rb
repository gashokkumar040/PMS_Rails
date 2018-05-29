
class ProjectsController < ApplicationController
  prepend_before_action :authenticate_admin!
  prepend_before_action :authenticate_user!
  prepend_before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    #@projects = Project.all
    @projects = current_user.projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @projects = current_user.projects
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
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
    #private
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:project_id, :project_title, :project_description, :user_id)
    end

    def find_project
      # by calling posts in this manner vs. `Post.find_by_id(params[:id])`, we
      # ensure we won't end up with a post belonging to another user
      current_user.projects.where(:id => params[:id]).first
    end

end
