// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
$.ajax({
	url:"../admin/piechart",
	type:"post",
	dataType:"json",
	success: function(data){
		/*$(data.piechart).each(function(){
			console.log(this.catename)
			console.log(this.users)
		})*/
		var catename=[];
		var users=[];
		for(var i=0; i<data.piechart.length;i++) {
			catename[i]=data.piechart[i].catename;
			users[i]=data.piechart[i].users;
			console.log(catename[i])
			console.log(users[i])
		}
		console.log(data.piechart)
		
		var ctx = document.getElementById("myPieChart");
		var myPieChart = new Chart(ctx, {
			type: 'doughnut',
			data: {
				labels: catename,
				datasets: [{
					data: users,
					backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
					hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
					hoverBorderColor: "rgba(234, 236, 244, 1)",
				}],
			},
			options: {
				maintainAspectRatio: false,
				tooltips: {
					backgroundColor: "rgb(255,255,255)",
					bodyFontColor: "#858796",
					borderColor: '#dddfeb',
					borderWidth: 1,
					xPadding: 15,
					yPadding: 15,
					displayColors: false,
					caretPadding: 10,
				},
				legend: {
					display: false
				},
				cutoutPercentage: 80,
			},
		});
		
		/*$(data.piechart).each(function(){
			output='';
			output += "<span class='mr-2'>"
					+ " <i class='fas fa-circle'></i>"+ this.catename
					+ "</span>"
			
			$(".mt-4").append(output);
		})*/
		
	}
	
})
