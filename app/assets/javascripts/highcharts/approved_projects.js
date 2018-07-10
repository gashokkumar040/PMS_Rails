   $(function () { 
        var myChart = Highcharts.chart('container', {
            chart: {
                // zoomType: 'x'
                type: 'line'
                // type: 'column'
            },
            title: {
                text: '<%= @object.first_name.capitalize%>,Approved Projects'
            },
            xAxis: {
              gridLineWidth: 1,
                title: {
                  text: 'no. of projects'
                }
            },
            yAxis: {
               gridLineWidth: 1,
                categories: <%= CreditChecker.ids.count %>,

                title: {
                    text: 'Count'
                }
            },
            tooltip: {
              formatter: function() {
              return 'count : <b>' + this.x + ',<br> </b>'+this.series.name +' id: <b>' + this.y + '</b>';
              },
              //crosshairs: [true, false],
              backgroundColor: '#FCFFC5',
              borderColor: 'black',
              borderRadius: 10,
              borderWidth: 3
            },
            plotOptions: {
              column: { borderRadius: 5 },
              series: {
                label: { connectorAllowed: false },
                pointStart: 1
              }
            },
                
            series: [ {
                name: 'Approved Projects',
                data: <%= Project.where("approved = true AND user_id = ?",@object.id).ids %>
            }],
            responsive: {
              rules: [{
                condition: { maxWidth: 500 },
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