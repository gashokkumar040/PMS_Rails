class TransactionHistory < ApplicationRecord
  # default_scope order("#{self.table_name}.updated_at DESC")
  belongs_to :user
  belongs_to :wallet

  CURRENCY_TYPES = ['inr', 'btc']

  # validates :user,          presence: true
  # validates :wallet,        presence: true
  validates :currency_type, presence: true, inclusion: {in: CURRENCY_TYPES}
  # validates :inr_amount,    presence: true, numericality: true
  # validates :btc_amount,    presence: true, numericality: true
  # validates :inr_balance,   presence: true, numericality: true
  # validates :btc_balance,   presence: true, numericality: true
  # validates :inr_status,    presence: true
  # validates :btc_status,    presence: true

  # before_validate :load_defaults

end