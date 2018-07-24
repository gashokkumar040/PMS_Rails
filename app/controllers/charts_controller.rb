class ChartsController < ApplicationController
  def new_btc
    # render json: User.group_by_day(:updated_at).count
    render json: TransactionHistory.group(:btc_per_transaction).group_by_day(:created_at).count
    # render json: TransactionHistory.group(:created_at).sum(:btc_per_transaction)
    # render json: TransactionHistory.group(:updated_at).sum(:btc_per_transaction)

    
    # render json: TransactionHistory.group_by_minute(:created_at).count
    # render json: TransactionHistory.group_by_minute(:updated_at).count
    # render json: Currency.group_by_day(:created_at).group(:btc_inr).count.chart_json

  end

  def by_month_btc
    render json: Currency.group_by_month_of_year(:created_at, time_zone: false).count
  end
end
