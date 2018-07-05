class CreditCheckersController < ApplicationController
   # prepend_before_action :authorize_user!
  prepend_before_action :authenticate_user!
  before_action :set_credit_checker, only: [:show, :edit, :update, :destroy]

  # GET /credit_checkers
  # GET /credit_checkers.json
  def index
    @credit_checkers = CreditChecker.all

    respond_to do |format|
      format.html
    end
  end

  # GET /credit_checkers/1
  # GET /credit_checkers/1.json
  def show
  end

  # GET /credit_checkers/new
  def new
    @credit_checker = CreditChecker.new
  end

  # GET /credit_checkers/1/edit
  def edit
  end

  # POST /credit_checkers
  # POST /credit_checkers.json
  def create
    @credit_checker = CreditChecker.new(credit_checker_params)

    respond_to do |format|
      if @credit_checker.save
        format.html { redirect_to @credit_checker, notice: 'Credit checker was successfully created.' }
        format.json { render :show, status: :created, location: @credit_checker }
      else
        format.html { render :new }
        format.json { render json: @credit_checker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_checkers/1
  # PATCH/PUT /credit_checkers/1.json
  def update
    respond_to do |format|
      if @credit_checker.update(credit_checker_params)
        format.html { redirect_to @credit_checker, notice: 'Credit checker was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_checker }
      else
        format.html { render :edit }
        format.json { render json: @credit_checker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_checkers/1
  # DELETE /credit_checkers/1.json
  def destroy
    @credit_checker.destroy
    respond_to do |format|
      format.html { redirect_to credit_checkers_url, notice: 'Credit checker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_checker
      @credit_checker = CreditChecker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_checker_params
      # params.fetch(:credit_checker, {})
      params.require(:credit_checker).permit(:id,:user_id,:project_id,:balance, :amount,:account_status)   
    end

end
