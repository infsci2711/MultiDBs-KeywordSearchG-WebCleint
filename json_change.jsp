<!-- 
Document   : jso
Created on : Feb 23, 2015, 5:29:42 AM
Author     : jiechen
--!>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"> </script>

		<script>

			$(document).ready(function()  { 
				// String='neo4j.json';
				$('#MyButton').click(function(){
					//var people = [];

					var data_file = "http://localhost:7654/Result/"+document.getElementById('mytext').value.toString();
					var data_file = "http://localhost:3000/all";

					$.ajax({
						//type:"GET", 
						url: data_file, 
						dataType: 'json',
						contentType: "application/json",
						crossDomain: true,
						success: function(data) {
							$("#userdata tbody").empty();
							$("#userdata2 tbody").empty();

							$.each(data, function(i,f) {
								$.each(f.searchResult, function(i,f1) {
									var tblRow = "<tr>" +"<td>" + f1.keyword + "</td>"+ "<td>" + f1.record + "</td>" +
										"<td>" + f1.column + "</td>" + "<td>" + f1.table + "</td>" + "<td>" + f1.database + "</td>" + "</tr>"
									$(tblRow).appendTo("#userdata tbody");
								}); 

								$.each(f.join, function(i,f2) {
									var tblRow = "<tr>" +"<td>" + f2.cost + "</td>"+ "<td>" + f2.rank + "</td>" +
										"<td>" + f2.relations + "</td>" + "</tr>"
									$(tblRow).appendTo("#userdata2 tbody");

								}); 
							}); 
						}, 
						error: function(jqXHR, textStatus, errorThrown) {
							alert(textStatus);
						},
					});

				});
			});

		</script>
	</head>

	<body>

		<div class="wrapper" align="center">
			<div class="profile" align="center">
				<h1 align="center">Key Word Search</h1>
				<form>

					<input type="text" id='mytext' align="center">
					<button type="button"  id="MyButton" align="center" >Search</button>
				</form>
				<form id="myform">


					<table id= "userdata" border="2" align="center">

						<thead>
							<th>KeyWords</th>
							<th>Record</th>
							<th>Column</th>
							<th>Table</th>
							<th>Database</th>
						</thead>
						<tbody>

						</tbody>
					</table>

					<table id= "userdata2" border="2" align="center">

						<thead>
							<th>Cost</th>
							<th>Rank</th>
							<th>Relation</th>
						</thead>
						<tbody>

						</tbody>
					</table>
				</form>
			</div>
		</div>

	</body>
</html>
