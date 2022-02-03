var ctx = document.getElementById("velocity-chart").getContext("2d");

//allDefects = document.querySelectorAll('.defectCount');
// obtain teh week labels
weeks = document.querySelectorAll(".weeks");

//updatedDefectArray = [];
weekLabelArray = [];
for (var i = 0; i < weeks.length; i++) {
    weekLabelArray.push(weeks[i].textContent);
}
//console.log(weekLabelArray)

// obtain the target points labels
targetPoints = document.querySelectorAll(".points");

//updatedDefectArray = [];
targetPointArray = [];
for (var i = 0; i < targetPoints.length; i++) {
    targetPointArray.push(targetPoints[i].textContent);
}
//console.log(targetPointArray)

// obtain the ideal points labels
idealPoints = document.querySelectorAll(".ideal");

//updatedDefectArray = [];
idealPointsArray = [];
for (var i = 0; i < idealPoints.length; i++) {
    idealPointsArray.push(idealPoints[i].textContent);
}
//console.log(idealPointsArray)

// obtain the actual points labels
actualPoints = document.querySelectorAll(".actual");

//updatedDefectArray = [];
actualPointsArray = [];
for (var i = 0; i < actualPoints.length; i++) {
    actualPointsArray.push(actualPoints[i].textContent);
}
//console.log(actualPointsArray)

var myChart = new Chart(ctx, {
    type: "line",
    data: {
        labels: weekLabelArray,
        datasets: [
            {
                data: targetPointArray,
                label: "Target",
                borderColor: "#f20014",
                fill: false,
            },
            {
                data: idealPointsArray,
                label: "Ideal",
                borderColor: "#3d02ed",
                fill: false,
            },
            {
                data: actualPointsArray,
                label: "Actual",
                borderColor: "#0af244",
                fill: false,
            },
        ],
    },
    options: {
        title: {
            position: "top",
            alighn: "center",
            display: true,
            text: "Velocity Chart",
        },
        maintainAspectRatio: false,
        scales: {
            yAxes: [
                {
                    ticks: {
                        min: 0,
                        stepSize: 20,
                        // beginAtZero: true
                    },
                },
            ],
        },
    },
});
