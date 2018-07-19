class Wallet < ApplicationRecord
  belongs_to :user
  has_many :transaction_histories

  # accepts_nested_attributes_for :transaction_histories

  # attr_accessor :transaction_histories_fields

  # validates :user,         presence: true
  # validates :inr_balance,  presence: true, numericality: true
  # validates :btc_balance,  presence: true

  # before_save :create_history, on: :update

  # def transaction_history_fields(inr_amount,btc_amount,inr_balance,btc_balance)
  #   @inr_amount  = inr_amount
  #   @btc_amount  = btc_amount
  #   @inr_balance = inr_balance
  #   @btc_balance = btc_balance
  # end

  def create_history
    # @hash = Hash.new{ |h,k| h[k]=[] }
    # params["/buy_btc"].each{ |k,v| @hash[k] << v }

    # @btc_amount = @hash['btc_amount'][0].to_f
    # @inr_amount = @hash['inr_amount'][0].to_f
    puts "@@@@@ model @@@@@@"
    puts "#{self.btc_balance}"
    puts "inr_amount in model  = #{@inr_amount}"
    puts "btc_amount in model  = #{@btc_amount}"
    puts "inr_balance in model = #{@inr_balance}"
    puts "btc_balance in model = #{@btc_balance}"
    if self.btc_balance_changed?
      

      TransactionHistory.create(currency_type: "inr", inr_amount: @inr_amount, inr_balance: @inr_balance, inr_status: 'debit', user_id: user.id,  wallet_id: self.id)
      TransactionHistory.create(currency_type: "btc", btc_amount: @btc_amount, btc_balance: @btc_balance, btc_status: 'credit', user_id: user.id,  wallet_id: self.id)

    # elsif self.inr_balance_changed?
    #   TransactionHistory.create(currency_type: "inr", inr_amount: @inr_amount, inr_balance: @inr_balance, inr_status: 'debit', user_id: current_user.id,  wallet_id: self.id)
    #   TransactionHistory.create(currency_type: "btc", btc_amount: @btc_amount, btc_balance: @btc_balance, btc_status: 'credit', user_id: current_user.id,  wallet_id: self.id)

    end
  end

end
