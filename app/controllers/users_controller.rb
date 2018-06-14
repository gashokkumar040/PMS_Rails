class UsersController < ApplicationController
  load_and_authorize_resource
  #prepend_before_action :authenticate_admin!
  before_action :authenticate_user!

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    #@users = User.where.not(:id => current_user.id)
    @users = User.all
     #@user = User.find(params[:id])
    # if current_user
    #   redirect_to root_path
    # end
  end
  
  # def index
  #   @users = User.where.not(:id => current_user.id)
  # end

  # GET /users/1
  # GET /users/1.json
  def show
    #@user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    #@user = current_user.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      #@user.save_changes
      if @user.save
        format.html { redirect_to @user, notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    params[:user].delete(:encrypted_password) if params[:user][:encrypted_password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:encrypted_password].blank? and params[:user][:password_confirmation].blank?
    
    respond_to do |format|
      if @user.update(user_params) 
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   @user = User.find(params[:id])
  #   params[:user].delete(:password) if params[:user][:password].blank?
  #   params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    
  #   if @user.update(user_params)
  #     flash[:notice] = "Successfully updated User."
  #     redirect_to root_path
  #   else
  #     render :action => 'edit'
  #   end
  # end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
      #params.fetch(:user, {})
      params.require(:user).permit(:first_name,:last_name, :username,:date_of_birth,:is_female,:phonenum,:email, :password_confirmation,:encrypted_password,:organization_id)
  end

  private

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user_params
      user.email_activate
      flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to @user
    else
      flash[:error] = "Error: User does not exist"
      redirect_to root_url
    end
  end
end
