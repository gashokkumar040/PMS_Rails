class UsersController < ApplicationController

  prepend_before_action :authenticate_user!

  prepend_before_action :set_user, only: [:show, :edit, :update, :destroy]

    # prepend_before_action :configure_sign_up_params, only: [:create]
    # prepend_before_action :configure_account_update_params, only: [:update]


  

  # GET /users
  # GET /users.json
  def index
    #@users = User.all
    @user = User.find(params[:id])
    # if current_user
    #   redirect_to projects_path
    # end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #@user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new(user_params)
  end

  # GET /users/1/edit
  def edit
    @user = current_user.find(params[:id])
  end

# ===
#  def create
#     @user = User.new(params[:user])
 
#     respond_to do |format|
#       if @user.save
#         # Tell the UserMailer to send a welcome email after save
#         UserMailer.welcome_email(@user).deliver
 
#         format.html { redirect_to(@user, notice: 'User was successfully created.') }
#         format.json { render json: @user, status: :created, location: @user }
#       else
#         format.html { render action: 'new' }
#         format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     end
#   end
# ====

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
      params.fetch(:user, {})
      #params.require(:user).permit(:first_name, :username, :password_confirmation, :last_name, :date_of_birth,:is_female,:phonenum,:email,:encrypted_password)
    end

    # ===========
    private

    # def sign_up_params
    #     params.require(:user).permit(:first_name, :last_name,:username, :phonenum,:is_female,:date_of_birth,
    #         :email, :password, :password_confirmation)
    # end

    # def account_update_params
    # params.require(:user).permit(:first_name, :last_name,:username, :phonenum,:is_female,:date_of_birth,
    #         :email, :password, :password_confirmation, :current_password)
    # end

    # before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]
    # ===========

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
