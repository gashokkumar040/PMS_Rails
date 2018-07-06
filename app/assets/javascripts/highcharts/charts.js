$(function () { 
        var myChart = Highcharts.chart('container', {
            chart: {
                zoomType: 'x'
            },
            title: {
                text: 'Projects Details'
            },
            xAxis: {
                title: {
                  text: 'no. of projects'
                }
            },
            yAxis: {
                title: {
                    text: 'count'
                }
            },
            tooltip: {
            
              shared: true,
              useHTML: true,
              headerFormat: '<small>count id: {point.key}</small><table>'
              ,pointFormat: '<tr><td style="color: {series.color}">{series.name} id : </td>' +
                      '<td style="text-align: left;"><b>{point.y} </b></td></tr>',
              footerFormat: '</table>',
              //valueDecimals: 2,

                  //simple string format
              // formatter: function() {
              // return 'count : <b>' + this.x + ',<br> </b>'+this.series.name +' id: <b>' + this.y + '</b>';
              // },
              //crosshairs: [true, false],
              backgroundColor: '#FCFFC5',
              borderColor: 'black',
              borderRadius: 10,
              borderWidth: 3
            },
            // legend: {

            //     layout: 'vertical',
            //     align: 'right',
            //     verticalAlign: 'middle'
            // },
             plotOptions: {
                  series: {
                      label: {
                          connectorAllowed: false
                      },
                      pointStart: 1
                  }
              },
                
            series: [{
                name: 'list of credit_checkers',
                data: <%= CreditChecker.ids%>//
            }, {
                name: 'Approved Projects',
                data: <%= Project.where("approved = true").ids%>
            }, {
                name: 'Un Approved Projects',
                data: <%= Project.where("approved = false").ids%>
                          
                //<%= CreditChecker.where("user_id =? AND project_id =?",@object.id,35).count%>
            }],
             responsive: {
                  rules: [{
                      condition: {
                          maxWidth: 500
                      },
                      chartOptions: {
                          legend: {
                              layout: 'horizontal',
                              align: 'center',
                              verticalAlign: 'bottom'
                          }
                      }
                  }]
              }

        });//high chart end

       

    });//function end