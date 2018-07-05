module CreditCheckersHelper

  def projects_by_approval_date 
    bar_chart User.credit_checkers.group(:project_id).count, height: '500px', library: {
      title: {text: 'CreditCheckers...', x: -20},
      yAxis: {
         allowDecimals: false,
         title: {
             text: 'Projects count'
         }
      },
      xAxis: {
         title: {
             text: 'Balance'
         }
      }
    }
  end

end
