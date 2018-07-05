<script>
    $(function () { 
        var myChart = Highcharts.chart('container', {
            chart: {
                type: 'bar'
            },
            title: {
                text: 'user balance sheet'
            },
            xAxis: {
                 // categories: ['Apples', 'Bananas', 'Oranges']
            },
            yAxis: {
                // title: {
                //     text: 'Fruit eaten'
                // }
            },
            series: [{
              name: "approved projects",
              data: [<%= @data %>]
            }]
        });
    });
  </script>