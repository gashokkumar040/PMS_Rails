class ChartsController < ApplicationController
  def new_users
    # render json: User.group_by_day(:updated_at).count
    render json: TransactionHistory.group_by_day(:created_at).count
    
    # render json: TransactionHistory.group_by_minute(:created_at).count
    # render json: TransactionHistory.group_by_minute(:updated_at).count

    # render json: Currency.group_by_minute(:updated_at).count


  end

  # def by_month_users
  #   render json: User.group_by_month_of_year(:created_at).count
  # end

  # def approved_projects
  #   render json: Project.group_by_day(:created_at).count
  # end

  # def projects_by_approval_date
  #   result = CreditChecker.group(:project_id).count
  #   render json: [{name: 'Count', data: result}]
  # end
end