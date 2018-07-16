class CurrencyConvertersController < ApplicationController
  before_action :set_currency_converter, only: [:show, :edit, :update, :destroy]

  # GET /currency_converters
  # GET /currency_converters.json
  def index
    @currency_converters = CurrencyConverter.all
  end

  # GET /currency_converters/1
  # GET /currency_converters/1.json
  def show
  end

  # GET /currency_converters/new
  def new
    @currency_converter = CurrencyConverter.new
  end

  # GET /currency_converters/1/edit
  def edit
  end

  # POST /currency_converters
  # POST /currency_converters.json
  def create
    @currency_converter = CurrencyConverter.new(currency_converter_params)

    respond_to do |format|
      if @currency_converter.save
        format.html { redirect_to @currency_converter, notice: 'Currency converter was successfully created.' }
        format.json { render :show, status: :created, location: @currency_converter }
      else
        format.html { render :new }
        format.json { render json: @currency_converter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /currency_converters/1
  # PATCH/PUT /currency_converters/1.json
  def update
    respond_to do |format|
      if @currency_converter.update(currency_converter_params)
        format.html { redirect_to @currency_converter, notice: 'Currency converter was successfully updated.' }
        format.json { render :show, status: :ok, location: @currency_converter }
      else
        format.html { render :edit }
        format.json { render json: @currency_converter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /currency_converters/1
  # DELETE /currency_converters/1.json
  def destroy
    @currency_converter.destroy
    respond_to do |format|
      format.html { redirect_to currency_converters_url, notice: 'Currency converter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency_converter
      @currency_converter = CurrencyConverter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def currency_converter_params
      params.fetch(:currency_converter, {})
    end
end
