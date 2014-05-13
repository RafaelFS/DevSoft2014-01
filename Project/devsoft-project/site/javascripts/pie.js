$(function () {
              var chart;
              
              $(document).ready(function () {
                $.getJSON("data/estagios", function( data ) {
                  console.log(data.estagios);
                  console.log(data.estagios.length);
                  var totalnumber = data.estagios.length;
                  var blanknumber = 0;
                  $.each(data.estagios, function( index, value ){
                      if(value.requisitos =="") {
                        blanknumber += 1;
                      }
                  });
                  console.log("blanknumber = " + blanknumber);
                  var validnumber = totalnumber - blanknumber;
                  var validpercent = 100*Math.round(validnumber/totalnumber);
                  var blankpercent = 100*Math.round(blankpercent/totalnumber);
                  $('#acessadas').append( "Total de páginas acessadas: "+data.estagios.length);
                  $('#datasummary').append( "Total: "+data.estagios.length+"<br/>Válidas: "+validnumber+"<br/>Em branco:"+blanknumber);
                // Build the chart
                  $('#graph').highcharts({
                      chart: {
                          plotBackgroundColor: null,
                          plotBorderWidth: null,
                          plotShadow: false
                      },
                      title: {
                          text: 'Resumo das vagas acessadas'
                      },
                      tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                      },
                      plotOptions: {
                          pie: {
                              allowPointSelect: true,
                              cursor: 'pointer',
                              dataLabels: {
                                  enabled: false
                              },
                              showInLegend: true
                          }
                      },
                      series: [{
                          type: 'pie',
                          name: 'Número de vagas',
                          data: [
                              ['Válidas',   validpercent],
                              ['Em branco',       blankpercent],
                          ]
                      }]
                  });
                });
              })
              
          });