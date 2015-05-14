<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="YudanshaStats.ascx.cs" Inherits="Yudansha.usercontrols.yudansha.YudanshaStats" %>
<script src="/scripts/canvasjs/canvasjs.min.js"></script>
<script type="text/javascript">
    window.onload = function () {
        var chart = new CanvasJS.Chart("yudanshaByCountry",
	{
	    title: {
	        text: "Yudansha by Country"
	    },
	    exportFileName: "Pie Chart",
	    exportEnabled: false,
	    animationEnabled: true,
	    legend: {
	        verticalAlign: "bottom",
	        horizontalAlign: "center"
	    },
	    data: [
		{
		    type: "pie",
		    showInLegend: true,
		    toolTipContent: "{legendText}: <strong>{y}</strong>",
		    percentFormatString: "#",
		    indexLabel: "{y} (#percent%)",
		    dataPoints: [
                <%= GetYudanshaByCountry() %>
		    ]
		}
	    ]
	});
        chart.render();


        var chart2 = new CanvasJS.Chart("yudanshaByRank",
	{
	    title: {
	        text: "Overall Rank Distribution"
	    },
	    exportFileName: "Pie Chart",
	    exportEnabled: false,
	    animationEnabled: true,
	    legend: {
	        verticalAlign: "bottom",
	        horizontalAlign: "center"
	    },
	    data: [
		{
		    type: "pie",
		    showInLegend: true,
		    toolTipContent: "{legendText}: <strong>{y}</strong>",
		    percentFormatString: "#",
		    indexLabel: "{y} (#percent%)",
		    dataPoints: [
                <%= GetYudanshaByRank() %>
		    ]
		}
	    ]
	});
        chart2.render();

        var chart3 = new CanvasJS.Chart("yudanshaByCountryRank", {
            title: {
                text: "Rank Distribution by Country"
            },
            animationEnabled: true,
            axisX: {
                interval: 1,
                labelFontSize: 10,
                lineThickness: 0
            },
            axisY2: {
                valueFormatString: "0",
                lineThickness: 0
            },
            toolTip: {
                shared: true
            },
            legend: {
                verticalAlign: "top",
                horizontalAlign: "center"
            },

            data: [
                 <%= GetYudanshaBycountryRank() %>
            ]
        });
        chart3.render();

    }
</script>

<div class="mainDiv">
    <div id="yudanshaByRank" style="height: 300px; width: 350px; float: left;"></div>
    <div id="yudanshaByCountry" style="height: 300px; width: 350px; float: left;"></div>
    <div id="yudanshaByCountryRank" style="height: 300px; width: 550px; float: left;"></div>
    <div id="map-canvas" style="height: 500px; width: 80%; float: left;"></div>

    <style>
        #map-canvas {
            display: none;
            height: 100%;
            margin: 0px;
            padding: 0px;
            margin-top: 10px;
        }
    </style>

    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
    <script>
        // This example creates circles on the map, representing
        // populations in North America.

        // First, create an object containing LatLng and population for each city.
        var citymap = {};
        <%= GetCitiesLatLong() %>

        var cityCircle;

        function initialize() {
            // Create the map.
            var mapOptions = {
                zoom: 2.1,
                center: new google.maps.LatLng(37.09024, 0),
                mapTypeId: google.maps.MapTypeId.TERRAIN
            };

            var map = new google.maps.Map(document.getElementById('map-canvas'),
                mapOptions);

            // Construct the circle for each value in citymap.
            // Note: We scale the area of the circle based on the population.
            for (var city in citymap) {
                var populationOptions = {
                    strokeColor: '#FF0000',
                    strokeOpacity: 0.8,
                    strokeWeight: 2,
                    fillColor: '#FF0000',
                    fillOpacity: 0.35,
                    map: map,
                    center: citymap[city].center,
                    radius: Math.sqrt(citymap[city].population) * 100000
                };
                // Add the circle for this city to the map.
                cityCircle = new google.maps.Circle(populationOptions);
            }
        }

        google.maps.event.addDomListener(window, 'load', initialize);

    </script>
</div>
