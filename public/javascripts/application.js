//console.log("XXXXXXXXXXXXXZZXZXZXZXZXZXZXZXZXZXZXZXZXZXZXZXZXZXZXXZ");
var ctx = document.getElementById("myChart").getContext("2d");

allDefects = document.querySelectorAll(".defectCount");
updatedDefectArray = [];
for (var i = 0; i < allDefects.length; i++) {
    updatedDefectArray.push(allDefects[i].textContent);
}

var myChart = new Chart(ctx, {
    type: "bar",
    data: {
        labels: ["New", "Open", "Closed", "In-Progress"],
        datasets: [
            {
                label: "Defect Status",
                data: updatedDefectArray,
                backgroundColor: [
                    "rgba(54, 162, 235, 0.2)",
                    "rgba(255, 99, 132, 0.2)",
                    "rgba(75, 192, 192, 0.2)",
                    "rgba(255, 206, 86, 0.2)",
                ],
                borderColor: [
                    "rgba(54, 162, 235, 1)",
                    "rgba(255, 99, 132, 1)",
                    "rgba(75, 192, 192, 1)",
                    "rgba(255, 206, 86, 1)",
                ],
                borderWidth: 5,
            },
        ],
    },
    options: {
        title: {
            position: "top",
            alighn: "center",
            display: true,
            text: "Current Sprint - Defect Summary",
        },
        maintainAspectRatio: false,
        scales: {
            yAxes: [
                {
                    ticks: {
                        min: 0,

                        stepSize: 1,
                        // beginAtZero: true
                    },
                },
            ],
        },
    },
});
