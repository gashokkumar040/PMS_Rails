module UsersHelper
  def users_for_show
    User.all.collect { |u| [u.first_name,u.last_name,u.date_of_birth,u.phonenum,u.email] }
  end
end
