# require 'faraday'
# require 'json'

module UsersHelper
 

  def users_for_show
    User.all.collect { |u| [u.first_name,u.last_name,u.date_of_birth,u.phonenum,u.email] }
  end

 #  def users_connection
 #   Faraday.new(:url => 'https://free.currencyconverterapi.com/api/v5/convert?q=btc_inr&compact=ultra')
 #  end
 #  def users_all
 #   request = users_connection.get do |req|
 #     req.url '/v2/users'
 #     req.headers['Authorization'] = ENV["DO_TOKEN"]
 #   end

 #   users = JSON.parse(request.body)
 #   users["users"]
 # end

  # for high chart
  # def high_chart_data
  #   User.credit_checkers.collect
  # end

  def users_by_age
    bar_chart @users.group(:credits).count, height: '500px', library: {
      title: {text: 'Users by credits', x: -20},
      yAxis: {
         allowDecimals: false,
         title: {
             text: 'Credits count'
         }
      },
      xAxis: {
         title: {
             text: 'Credit'
         }
      }
    }
  end

  def projects_by_approval
    bar_chart @users.projects.where(:approved =>true).count,height: '500px', library: {
      title: {text: 'Users by credits', x: -20},
      yAxis: {
         allowDecimals: false,
         title: {
             text: 'Credits count'
         }
      },
      xAxis: {
         title: {
             text: 'Credit'
         }
      }
    }
  end


    

end
