<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Chart Page</title>
		<script>
			var chart;
			var excelData;
			//Receive excel data
			function getExcelData(index){
				$.ajax({
					type: "POST",
					dataType: "json",
					data: {"excelIndex":index},
					url: "/getExcelData",
					success: function(data){
						excelData = data;
						alert("엑셀데이터를 성공적으로 받아왔습니다!");
					},
					error: function(xhr, status, error){
						alert(error);
					}
				});
			}
			//Get min year
			function getMinYear(array){
				var minYear;
				for(var i=0;i<array.length;i++){
					if(!minYear || minYear>array[i])
						minYear = array[i];
				}
				return minYear;
			}
			//Get max year
			function getMaxYear(array){
				var maxYear;
				for(var i=0;i<array.length;i++){
					if(!maxYear || maxYear<array[i])
						maxYear = array[i];
				}
			return maxYear;
			}
			//Make year json data
			function yearJsonData(minYear,MaxYear){
				var yearList = new Array();
				for(var i = minYear;i<=MaxYear;i++){
					var data = new Object();
					data.year = i;
					data.count = 0;
					yearList.push(data);
				}
			return yearList;
			}
			function drawYearChart(data){
				var registrationArray = new Array();
				for(var i = 0; i< data.length; i++){
					registrationArray[i] = Number(data[i].registrationNumber.substring(0,4));
				}
				minYear = getMinYear(registrationArray);
				maxYear = getMaxYear(registrationArray);
				yearList = yearJsonData(minYear,maxYear);
				for(var i=0;i<registrationArray.length;i++){
					$.each(yearList,function(index,item){
						if(item.year == registrationArray[i]){
							item.count++;
							return false;
						}
					});
				}
				console.log(yearList);
				//var strData = JSON.stringify(yeerList);
				//console.log(strData);
				//Set chart
				var options = {
			            data: {
			                data: yearList,
			                type: 'json'
			            },
			            format: {
			                xAxis: null,
			                yAxis: null
			            },
			            use: {
			                animate: true,
			                aCrossLine: true
			            }
			        };
			        var styles = {
			            main: {
			                layout: {
			                    paddingTop: 30,
			                    paddingRight: 30,
			                    color: '#f8f8f8',
			                    line: {
			                        color: '#eaeaea',
			                        width: 1
			                    }
			                },
			                graph: {
			                    color: '#f8f8f8',
			                    line: {
			                        top: {
			                            color: '#cccccc'
			                        },
			                        left: {
			                            width: 0
			                        },
			                        right: {
			                            width: 0
			                        },
			                        bottom: {
			                            color: '#cccccc'
			                        }
			                    }
			                },
			                crossLine: {
			                    color: '#465866'
			                },
			                xAxis: {
			                    paddingTop: 13,
			                    height: 30,
			                    text: {
			                        family: 'Nanum Gothic',
			                        size: 12,
			                        color: '#666'
			                    },
			                    line:{
			                    	color: '#e3e3e3', 
			                    	width: 1
			                    }
			                },
			                yAxis: {
			                    text: {
			                        family: 'Nanum Gothic',
			                        size: 12,
			                        color: '#666',
			                        align: 'right'
			                    },
			                    line:{
			                    	color: '#cccccc', 
			                    	width: 1, 
			                    	opacity: 1
			                    }
			                },
			                tip: {
			                    className: 'tip'
			                },
			                series: {
			                    s1: {
			                    	area: {
										normal: {
											color: [ [0, '#2bcdba'], [100, '#6bdccf'] ],
											over: { 
												color: {
													src: '../export/sample/chart/img/over.png', 
													color: '#4e6679'
												} 
			                				}
										}
									},
			                        line: {
			                            normal: {
			                                width: 0,
			                                over: {
			                                    width: 0
			                                }
			                            }
			                        },
			                        gradient: {
			                            direction: 'vertical'
			                        },
			                    },
			                    s2: {
			                        line: {
			                            normal: {
			                                color: '#feb401',
			                                width: 3,
			                                over: {
			                                    color: '#feb401',
			                                    width: 3
			                                }
			                            }
			                        },
			                        tick: {
			                            style: 'circle',
			                            size: 5,
			                            overSize: 1.5,
			                            area: {
			                                normal: {
			                                    color: '#fff',
			                                    over: {
			                                        color: '#fff'
			                                    }
			                                }
			                            },
			                            line: {
			                                normal: {
			                                    color: '#feb401',
			                                    width: 3,
			                                    over: {
			                                        color: '#465866',
			                                        width: 3
			                                    }
			                                }
			                            }
			                        }
			                    }
			                }
			            }
			        };
			        var series = {
			            "main":{
							s1: {series: 'column', xaxis: 'yeer', yaxis: 'count'},
							s2: {series: 'line', xaxis: 'yeer', yaxis: 'count'}
						}
			        };
			        chart = webponent.chart.init($('.chart01'), options, styles, series);
			}
		</script>
		<!-- chart css -->
		<link rel="stylesheet" href="/export/sample/layout/css/layout.css">
   		<style>
        	.wrap {
            	width: 100%;
            	height:70%;
        	}
        	.chart01 {
            	width: 100%;
            	height: 400px;
        	}
        	.chart01 .tip .text {
            	background: #465866;
            	color: #fff;
            	padding: 5px 10px;
            	border: 1px solid #fff;
            	border-radius: 2px;
        	}
        	.chart01 .tip .arrow {
            	height: 6px;
            	background: url(../export/sample/chart/img/tooltip_arrow.png) no-repeat center top;
            	margin-top: -1px;
            	font-size: 6px;
       		}
    	</style>
    	<!-- chart resources -->
		<script src="/resources/js/jquery-3.4.1.min.js"></script>
		<script src="/export/comm/webponent.comm.common.js"></script>
		<script src="/resources/js/raphael.js"></script>
		<script src="/export/chart/webponent.chart.js"></script>
	</head>
	<body>
		<p>Chart Service</p>
		<button id="excelBtn1" onClick="getExcelData(1);">인공지능 엑셀 데이터 받아오기</button>
		<button id="excelBtn2" onClick="getExcelData(2);">딥러닝 엑셀 데이터 받아오기</button>
		<button id ="chartBtn" onClick="drawYearChart(excelData);">차트 그리기</button>
		<div class="wrap">
        	<div class="chart01"></div>
    	</div>
	</body>
</html>