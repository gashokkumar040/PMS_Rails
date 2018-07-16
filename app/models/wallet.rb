class Wallet < ApplicationRecord
  belongs_to :user
  has_many :transaction_histories

  attr_accessor :transaction_histories_fields

  validates :user,         presence: true
  validates :inr_balance,  presence: true, numericality: true
  validates :btc_balance,  presence: true

  before_save :check_balance, on: :create

  def check_balance
    self.inr_balance  
    puts "@@@@@@@"
    puts "#{self.inr_balance}"  

    if self.inr_balance < 0 || self.inr_balance == 0 
      puts  "you don't have enough balance to buy BTC, please load cash on your wallet..."
      puts "#{@wallet}"
    end

  end

end
