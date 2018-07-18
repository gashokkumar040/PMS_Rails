class WalletsController < ApplicationController
  prepend_before_action :authenticate_user!
  before_action :set_wallet, only: [:show, :edit, :update, :destroy]

  # GET /wallets
  # GET /wallets.json
  def index
      @wallets = Wallet.all
      # @currency = Currency.first
  end

  # GET /wallets/1
  # GET /wallets/1.json
  def show
  end

  # GET /wallets/new
  def new
    @wallet = Wallet.new
  end

  # GET /wallets/1/edit
  def edit
  end

  # POST /wallets
  # POST /wallets.json
  def create
    @currency = Currency.first
    @wallet = Wallet.new(wallet_params)
    @wallet.user_id = current_user.id
   
    respond_to do |format|
      if @wallet.save
        format.html { redirect_to @wallet, notice: 'Wallet was successfully created.' }
        format.json { render :show, status: :created, location: @wallet }
      else
        format.html { render :new }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wallets/1
  # PATCH/PUT /wallets/1.json
  def update
    respond_to do |format|
      if @wallet.update(wallet_params)
        format.html { redirect_to @wallet, notice: 'Wallet was successfully updated.' }
        format.json { render :show, status: :ok, location: @wallet }
      else
        format.html { render :edit }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end


  def buy_btc
    @bal = current_user.wallet.inr_balance 
  end

  def save_btc

    # @hash = Hash.new{ |h,k| h[k]=[] }
    # params["/buy_btc"].each{ |k,v| @hash[k] << v }
    # params["/buy_btc"]["btc_amount"]
    # @btc_amount = @hash['btc_amount'][0].to_f
    # @inr_amount = @hash['inr_amount'][0].to_f
    @inr_amount = params["/buy_btc"]["inr_amount"].to_f
    @btc_amount = params["/buy_btc"]["btc_amount"].to_f
    @inr_balance = current_user.wallet.inr_balance
    @btc_balance = current_user.wallet.btc_balance

    if @inr_balance  > @inr_amount 
      
      @btc_balance += @btc_amount
      @inr_balance -= @inr_amount

      user_wallet = current_user.wallet

      user_wallet.inr_balance = @inr_balance
      user_wallet.btc_balance = @btc_balance

      respond_to do |format|
        if @btc_amount >= 0.03
          if user_wallet.save 
            # @history = user_wallet.transaction_history.create(transaction_history_params)
            TransactionHistory.create(currency_type: "inr", inr_amount: @inr_amount, inr_balance: @inr_balance, inr_status: 'debit', user_id: current_user.id,  wallet_id: user_wallet.id)
            TransactionHistory.create(currency_type: "btc", btc_amount: @btc_amount, btc_balance: @btc_balance, btc_status: 'credit', user_id: current_user.id,  wallet_id: user_wallet.id)
                  
            format.html { redirect_to wallets_path, notice: 'Added purchased BTC to your wallet...check your wallet' }
            puts "========="
            puts "after save btc_balance = #{@btc_balance}"
            puts "after save inr_balance = #{@inr_balance}"
            puts "========="
          end
        else
          puts "****** please purchase more than 0.03 btc amount *****"
          format.html { redirect_to buy_btc_path, notice: '****** please purchase more than 0.03 btc amount *****' }
        end
      end

    else
      respond_to do |format|
        puts "you don't have a enough balance... please add less than #{@inr_balance} this amount..."
        format.html { redirect_to buy_btc_path, notice: 'you dont have enough balance to buy btc... please enter ' }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wallet
      @wallet = Wallet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wallet_params
      params.require(:wallet).permit(:btc_balance, :inr_balance,:user_id)
    end

    def transaction_history_params
      params.require(:transaction_history).permit(:currency_type,:btc_amount,:inr_amount,:btc_balance, :inr_balance,:user_id,:inr_status,:btc_status,:wallet_id)
    end
end
