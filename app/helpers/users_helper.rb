module UsersHelper
  def users_for_show
    User.all.collect { |u| [u.first_name,u.last_name,u.date_of_birth,u.phonenum,u.email] }
  end

  # for high chart
  # def high_chart_data
  #   User.credit_checkers.collect
  # end
end
