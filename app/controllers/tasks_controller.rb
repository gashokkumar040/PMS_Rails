class TasksController < ApplicationController
  before_action :set_project
  prepend_before_action :set_task, only: [:show, :edit, :update, :destroy]
  prepend_before_action :set_project, only: [:show, :edit, :update, :destroy]
  prepend_before_action :authenticate_user!

  # GET /tasks
  # GET /tasks.json
  def index
    #1st you retrieve the project thanks to params[:project_id]
    project = Project.find(params[:project_id])
    #2nd you get all the tasks of this project
    @tasks = project.tasks

    respond_to do |format|
      format.html  # index.html.erb
      format.json { render :index, status: :created, location: @task }
    end
  end

  # GET /projects/:project_id/tasks/:id
  # GET /tasks/:id.json
  def show
    #first you retrive the project from params[:project_id] 
    @project = Project.find(params[:project_id])
    #2nd you retrieve the task thanks to params[:id]
    @task = @project.tasks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @task }
    end
  end

  # GET /tasks/new
  def new
    #first you retrive the project from params[:project_id] 
    @project = Project.find(params[:project_id])
    #2nd you build a new one
    @task = @project.tasks.build
    # respond_to do |format|
    #   format.html {} # new.html.erb
    #   format.json  { render :json => @task }
    # end
  end

  # GET /projects/:project_id/tasks/:id/edit
  def edit
    #first you retrive the project from params[:project_id] 
    @project = Project.find(params[:project_id])
    #2nd you retrieve the task thanks to params[:id]
    @task = @project.tasks.find(params[:id])
  end

  # POST /projects/:project_id/tasks
  # POST /projects/:project_id/tasks.json
  def create
    # @task = Task.new(task_params)
    # @task.user_id = current_user.id

    # respond_to do |format|
    #   if @task.save
    #     format.html { redirect_to @task, notice: 'Task was successfully created.' }
    #     format.json { render :show, status: :created, location: @task }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @task.errors, status: :unprocessable_entity }
    #   end
    # end

    #first you retrive the project from params[:project_id] 
    @project = Project.find(params[:project_id])

    #2nd you create the task with arguments in params[:task]
    @task = @project.tasks.create(task_params)

    respond_to do |format|
      if @task.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment

        format.html { redirect_to([@task.project, @task], :notice => 'Task was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource comment

        format.json  { render :json => @task, :status => :created, :location => [@task.project, @task] }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @task.errors, :status => :unprocessable_entity }
      end
    end

  end

  # PUT /projects/:project_id/tasks/:id
  # PUT /projects/:project_id/tasks/:id.json

  def update
    # respond_to do |format|
    #   if @task.update(task_params)
    #     format.html { redirect_to @task, notice: 'Task was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @task }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @task.errors, status: :unprocessable_entity }
    #   end
    # end

    #first you retrive the project from params[:project_id] 
    @project = Project.find(params[:project_id])

    #you retrive the task from params[:id]
    @task = @project.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(task_params)
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html{redirect_to([@task.project,@task], :notice=>'task was successfully updated.')}
        format.json{head :ok}
      else
        format.html{render :action => "edit"}
        format.json{render :json => @task.errors, :status => :unprocessable_entity}        
      end
    end
    
  end

  # DELETE /projects/:project_id/tasks/1
  # DELETE /projects/:project_id/tasks/1.json
  def destroy
    # @task.destroy
    # respond_to do |format|
    #   format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
    #   format.json { head :no_content }
    # end

    #first you retrive the project from params[:project_id] 
    @project = Project.find(params[:project_id])

    #2nd you retrive the task from params[:id]
    @task = @project.tasks.find(params[:id])

    @task = @project.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      #1st argument reference the path /projects/:project_id/tasks/

      format.html { redirect_to(project_tasks_url) }
      format.json  { head :ok }
    end
    
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
      #@project.user_id = current_user.id
    end
    #Use callbacks to share common setup or constraints between actions.
    def set_task
      begin
        @task = @project.tasks.find(params[:id]) #raises an exception if project not found        
      rescue ActiveRecord::RecordNotFound
        redirect_to tasks_path
      end  
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :subject, :due_date, :status, :description, :project_id, :user_id)
    end

end